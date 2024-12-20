import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/map/helpers/marco-teorico.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/data/data.dart';
import 'package:app_sw1final/helpers/markersCustom.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

enum TipoMarcador { caseta, comercial, entrada, namePasillo }

class MapBloc extends Bloc<MapEvent, MapState> {
  int statusZoom = 0;
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  final InfoMarkerBloc infoMarkerBloc;
  final OptionsMapBloc optionsMapBloc;
  MapBloc({required this.infoMarkerBloc, required this.optionsMapBloc})
      : super(MapState()) {
    on<OnChangedStatusFollowUser>((event, emit) {
      emit(state.copyWith(followUser: event.statusFollow));
    });
    on<OnInitFigureMap>(_onInitFigureMap);
    on<OnMapInitialControllerMap>(_onInitialControllerMap);
    on<OnMapControllerCamera>(_onMapControllerCamera);
    on<OnChangedDetailsCC>(_onChangedDetailsCC);
    on<OnChangedMapClean>(_onChangedMapClean);
    on<OnResetState>((event, emit) {
      emit(MapState());
    });

    on<OnCleanRutaPasada>((event, emit) {
      emit(state.copyWith(polylines: {}));
    });

    on<OnRutaCliente>((event, emit) async {
      try {
        final currentPolylines = Map<String, Polyline>.from(state.polylines);

        // Colores para las diferentes rutas
        final List<Color> coloresRutas = [
          const Color(0xFF4CAF50), // Verde
          const Color(0xFF2196F3), // Azul
          const Color(0xFFE91E63), // Rosa
          const Color(0xFFFF9800), // Naranja
          const Color(0xFF9C27B0), // Morado
          const Color(0xFF795548), // Marrón
          const Color(0xFF607D8B), // Azul grisáceo
          const Color(0xFFFF5722), // Naranja profundo
          const Color(0xFF673AB7), // Morado profundo
          const Color(0xFF009688), // Verde azulado
        ];

        // Crear polilíneas para rutasCaseta1
        for (int i = 0; i < rutasCaseta1.length; i++) {
          currentPolylines['ruta1_$i'] = Polyline(
            polylineId: PolylineId('ruta1_$i'),
            points: rutasCaseta1[i],
            color: coloresRutas[i % coloresRutas.length],
            width: 4,
          );
        }

        // Crear polilíneas para rutasCasera2
        for (int i = 0; i < rutasCasera2.length; i++) {
          currentPolylines['ruta2_$i'] = Polyline(
            polylineId: PolylineId('ruta2_$i'),
            points: rutasCasera2[i],
            color:
                coloresRutas[(i + rutasCaseta1.length) % coloresRutas.length],
            width: 4,
          );
        }

        emit(state.copyWith(
          polylines: currentPolylines,
        ));
      } catch (e) {
        print('Error en OnRutaCliente: $e');
      }
    });

    on<OnGenerateRutaOptimaIntera>((event, emit) async {
      try {
        final calculator = RouteCalculator();
        final currentPolylines = Map<String, Polyline>.from(state.polylines);

        if (event.puntosRuta.length < 2) {
          // Si no hay suficientes puntos, no podemos calcular la ruta
          return;
        }

        if (event.isOptimalRoute) {
          // Calcular ruta óptima
          double costoRuta = calculator.calculateOptimalRoute(event.puntosRuta);

          // Crear una polilínea para visualizar la ruta óptima
          currentPolylines["ruta_optima"] = Polyline(
            polylineId: const PolylineId("ruta_optima"),
            points: event.puntosRuta,
            color: const Color(0xFF00A541), // Verde
            width: 5,
          );

          // Aquí podrías mostrar el costo en la UI o guardarlo en el estado
          emit(state.copyWith(
            polylines: currentPolylines,
            rutaOptimaCosto: costoRuta,
          ));

          // Mover la cámara para mostrar la ruta completa
          if (mapController != null) {
            final bounds = _calculateBounds(event.puntosRuta);
            final cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
            await mapController!.animateCamera(cameraUpdate);
          }
        } else {
          // Calcular índice de complejidad
          double indiceComplejidad =
              calculator.calculateRouteComplexityIndex(event.puntosRuta);

          // Crear una polilínea para visualizar la ruta con complejidad
          currentPolylines["ruta_complejidad"] = Polyline(
            polylineId: const PolylineId("ruta_complejidad"),
            points: event.puntosRuta,
            color: Colors.orange, // Naranja para diferenciar
            width: 5,
          );

          // Emitir el nuevo estado con el índice de complejidad
          emit(state.copyWith(
            polylines: currentPolylines,
            rutaComplejidadIndice: indiceComplejidad,
          ));

          // Mover la cámara para mostrar la ruta completa
          if (mapController != null) {
            final bounds = _calculateBounds(event.puntosRuta);
            final cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
            await mapController!.animateCamera(cameraUpdate);
          }
        }
      } catch (e) {
        print("Error al generar la ruta: $e");
      }
    });
  }

  Future<void> _onInitFigureMap(event, emit) async {
    final currentMarkers = Map<String, Marker>.from(state.markers);
    // INICIALIZAR MARCADORES DE TODOS LOS CENTROS COMERCIALES
    currentMarkers.addAll(await GoogleMapCustom.comercialesMarcadores(
        infoMarkerBloc.state.centrosComerciales, infoMarkerBloc));
    add(const OnChangedDetailsCC(DetailCC.entrada));
    emit(state.copyWith(
      markers: currentMarkers,
    ));
  }

  Future<void> _onChangedMapClean(event, emit) async {
    final currentMarkers = Map<String, Marker>.from(state.markers);
    final currentPolygons = Map<String, Polygon>.from(state.polygons);
    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    switch (optionsMapBloc.state.detailView) {
      case DetailCC.entrada:
        currentPolygons.removeWhere((key, value) => key.contains("PCCC"));
        currentMarkers.removeWhere((key, value) => key.contains("PGME"));
        break;
      case DetailCC.pasillo:
        currentPolygons.removeWhere((key, value) => key.contains("PCCC"));
        currentPolylines.removeWhere((key, value) => key.contains("PGP"));
        currentMarkers.removeWhere((key, value) => key.contains("PGMP"));
        break;
      // case DetailCC.completo:
      default:
        currentPolygons.removeWhere((key, value) => key.contains("PCCC"));
        currentMarkers.removeWhere((key, value) => key.contains("PGME"));
        currentPolylines.removeWhere((key, value) => key.contains("PGP"));
        currentMarkers.removeWhere((key, value) => key.contains("PGMP"));
        break;
    }
    emit(state.copyWith(
      markers: currentMarkers,
      polygons: currentPolygons,
      polylines: currentPolylines,
    ));
  }

  Future<void> _onChangedDetailsCC(OnChangedDetailsCC event, emit) async {
    optionsMapBloc.add(OnChangeDetailView(event.detailCC));
    final currentMarkers = Map<String, Marker>.from(state.markers);
    final currentPolygons = Map<String, Polygon>.from(state.polygons);
    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    // print("object");
    if (infoMarkerBloc.state.centroComercial!.subscription) {
      if (infoMarkerBloc.state.centroComercial!.name ==
          "Centro Comercial Cañoto") {
        // CON SUBSCRIPCION
        switch (event.detailCC) {
          case DetailCC.entrada:
            // POLIGONO CENTRO COMERCIAL Y ENTRADAS
            currentPolygons.addAll(await GoogleMapCustom.loadKML(
                "assets/kmlCC/comercialCañoto.kml"));
            currentMarkers.addAll(await GoogleMapCustom.entryMarkers(
                coordenadasMarkerEntradaCANOTO));
            break;
          case DetailCC.pasillo:
            // POLIGONO CENTRO COMERCIAL Y PASILLOS
            currentPolygons.addAll(await GoogleMapCustom.loadKML(
                "assets/kmlCC/comercialCañoto.kml"));
            currentPolylines.addAll(
                await GoogleMapCustom.hallWays(coordenadasPasillosCANOTO));
            currentMarkers.addAll(await GoogleMapCustom.hallwayMarker(
                coordenadasMarkerPasillosCANOTO));
            break;
          // case DetailCC.completo:
          // POLIGONO CENTRO COMERCIAL ENTRADAS Y PASILLOS
          default:
            currentPolygons.addAll(await GoogleMapCustom.loadKML(
                "assets/kmlCC/comercialCañoto.kml"));
            currentPolylines.addAll(
                await GoogleMapCustom.hallWays(coordenadasPasillosCANOTO));
            currentMarkers.addAll(await GoogleMapCustom.hallwayMarker(
                coordenadasMarkerPasillosCANOTO));
            currentMarkers.addAll(await GoogleMapCustom.entryMarkers(
                coordenadasMarkerEntradaCANOTO));
            break;
        }
      } else {
        switch (event.detailCC) {
          case DetailCC.entrada:
            // POLIGONO CENTRO COMERCIAL Y ENTRADAS
            currentPolygons.addAll(await GoogleMapCustom.loadKML(
                "assets/kmlCC/comercialChiriguano.kml"));
            currentMarkers.addAll(await GoogleMapCustom.entryMarkers(
                coordenadasMarkerEntradaCHIRIGUANO));
            break;
          case DetailCC.pasillo:
            // POLIGONO CENTRO COMERCIAL Y PASILLOS
            currentPolygons.addAll(await GoogleMapCustom.loadKML(
                "assets/kmlCC/comercialChiriguano.kml"));
            currentPolylines.addAll(
                await GoogleMapCustom.hallWays(coordenadasPasillosCHIRIGUANO));
            currentMarkers.addAll(await GoogleMapCustom.hallwayMarker(
                coordenadasMarkerPasillosCHIRIGUANO));
            break;
          // case DetailCC.completo:
          // POLIGONO CENTRO COMERCIAL ENTRADAS Y PASILLOS
          default:
            currentPolygons.addAll(await GoogleMapCustom.loadKML(
                "assets/kmlCC/comercialChiriguano.kml"));
            currentPolylines.addAll(
                await GoogleMapCustom.hallWays(coordenadasPasillosCHIRIGUANO));
            currentMarkers.addAll(await GoogleMapCustom.hallwayMarker(
                coordenadasMarkerPasillosCHIRIGUANO));
            currentMarkers.addAll(await GoogleMapCustom.entryMarkers(
                coordenadasMarkerEntradaCHIRIGUANO));
            break;
        }
      }

      // if (infoMarkerBloc.state.centroComercial!.name ==
      //     "Centro Comercial Chiriguano") {}
    } else {
      // SIN SUBSCRIPCION
      // TODO (FALTA IMPLEMENTAR LOS MACADORES DE LAS ENTRADA)
      List<LatLng> puntosCC = poligonosCC
          .where((element) =>
              element.name == infoMarkerBloc.state.centroComercial!.name)
          .map((e) => e.puntos)
          .expand((i) => i)
          .toList();
      // Centro Comercial  Sin Subscripcion
      currentPolygons["CCSS0"] = Polygon(
        polygonId: const PolygonId("CCSS0"),
        points: puntosCC,
        fillColor: const Color(0xFF00A541).withOpacity(0.4),
        strokeColor: Colors.black.withOpacity(0.7),
        strokeWidth: 2,
      );
    }

    emit(state.copyWith(
      markers: currentMarkers,
      polygons: currentPolygons,
      polylines: currentPolylines,
    ));
  }

  Future<void> _onInitialControllerMap(
      OnMapInitialControllerMap event, Emitter<MapState> emit) async {
    mapController = event.controllerGoogleMap;
    emit(state.copyWith(
      isMapInitialized: true,
    ));
    add(const OnInitFigureMap());
  }

  Future<void> _onMapControllerCamera(event, emit) async {
    cameraPosition = event.cameraPosition;
    Map<String, Marker> currentMarkers =
        Map<String, Marker>.from(state.markers);
    if ((cameraPosition!.zoom >= 18.5) && !(statusZoom == 18)) {
      statusZoom = 18;

      switch (infoMarkerBloc.state.centroComercial!.name) {
        case "Ventura Mall":
          currentMarkers.addAll(await GoogleMapCustom.marcadoresCasetas(
              infoMarkerBloc, marcadoresCasetaVenturaMall));
          break;
        case "Centro Comercial Cañoto":
          currentMarkers.addAll(await GoogleMapCustom.marcadoresCasetas(
              infoMarkerBloc, marcadoresCasetaCCanoto));
          break;
        case "Centro Comercial Las Brisas":
          currentMarkers.addAll(await GoogleMapCustom.marcadoresCasetas(
              infoMarkerBloc, marcadoresCasetaCCBrisas));
          break;
        case "Centro Comercial MAQUIO":
          currentMarkers.addAll(await GoogleMapCustom.marcadoresCasetas(
              infoMarkerBloc, marcadoresCasetaCMaquito));
          break;
      }
    }
    if ((cameraPosition!.zoom < 18.5) && (statusZoom == 18)) {
      statusZoom = 0;
      currentMarkers.removeWhere((key, value) => key.contains("MCCCS"));
    }
    emit(state.copyWith(markers: currentMarkers));
  }

  @override
  Future<void> close() {
    add(const OnResetState());
    return super.close();
  }

  void moveCameraMyLocation(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLngZoom(newLocation, 17.5);
    mapController!.animateCamera(cameraUpdate);
  }

  void reorientMap() {
    if (mapController != null && cameraPosition != null) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: cameraPosition!.target,
              zoom: cameraPosition!.zoom,
              bearing: 0)));
    }
  }

// Método auxiliar para calcular los límites de la ruta
  LatLngBounds _calculateBounds(List<LatLng> points) {
    double minLat = points[0].latitude;
    double maxLat = points[0].latitude;
    double minLng = points[0].longitude;
    double maxLng = points[0].longitude;

    for (var point in points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }
}
