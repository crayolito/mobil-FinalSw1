import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/map/helpers/imageNetwork_marker.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/helpers/widget_to_market.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xml/xml.dart' as xml;

class GoogleMapCustom {
  // Future<Map<String, LatLng>> loadKML(String direction) async {
  static Future<Map<String, Polygon>> loadKML(String direction) async {
    // String kmlString = await rootBundle.loadString('assets/doc.kml');
    String kmlString = await rootBundle.loadString(direction);
    final document = xml.XmlDocument.parse(kmlString);
    Map<String, Polygon> polygons = {};
    // Map<String, LatLng> xyLimites = {};
    int i = 0;
    document.findAllElements('Placemark').forEach((placemarkElement) {
      placemarkElement
          .findAllElements('MultiGeometry')
          .forEach((multiGeometryElement) {
        multiGeometryElement
            .findAllElements('Polygon')
            .forEach((polygonElement) {
          polygonElement
              .findAllElements('outerBoundaryIs')
              .forEach((outerBoundaryIsElement) {
            outerBoundaryIsElement
                .findAllElements('LinearRing')
                .forEach((linearRingElement) {
              linearRingElement
                  .findAllElements('coordinates')
                  .forEach((coordinatesElement) {
                List<LatLng> polygonCoordinates = [];
                String coordinates = coordinatesElement.text.trim();
                List<String> coordinateTuples =
                    coordinates.split(RegExp(r'\s+|\n+'));
                // int ip = 0;
                coordinateTuples.forEach((coordinateTuple) {
                  coordinateTuple = coordinateTuple.trim();
                  List<String> latLng = coordinateTuple.split(',');
                  if (latLng.length >= 2) {
                    double lat = double.parse(latLng[1]);
                    double lng = double.parse(latLng[0]);
                    polygonCoordinates.add(LatLng(lat, lng));
                    // xyLimites["${i}P${ip}"] = LatLng(lat, lng);
                    // ip++;
                  }
                });

                // POLIGONO CASETA CENTRO COMERCIAL
                polygons["PCCC$i"] = Polygon(
                  polygonId: PolygonId("PCCC$i"),
                  points: polygonCoordinates,
                  fillColor: const Color(0xFF00A541).withOpacity(0.4),
                  strokeColor: Colors.black.withOpacity(0.7),
                  strokeWidth: 2,
                );
                i++;
              });
            });
          });
        });
      });
    });
    return polygons;
    // return xyLimites;
  }

  static Future<Map<String, Marker>> marcadoresCasetas(
      InfoMarkerBloc infoMarkerBloc, List<Caseta> casetasTrabajo) async {
    Map<String, Marker> markers = {};
    final iconMarker = await getNetworkImageMarker(
        'https://res.cloudinary.com/da9xsfose/image/upload/v1715317489/ajskr46wpraysxj2ymgc.png');

    casetasTrabajo.asMap().forEach((index, caseta) {
      final marker = Marker(
          // Marcador Centro Comercial Comerciantes Seleccionado(Vendedores)
          markerId: MarkerId("MCCCS${caseta.id}"),
          icon: iconMarker,
          position: LatLng(caseta.latitud, caseta.longitud),
          onTap: () async {
            int idCaseta = caseta.id;
            Caseta casetaBuild = casetasTrabajo
                .firstWhere((element) => element.id == idCaseta);
            DataWindow buildData = DataWindow(
              weburl: casetaBuild.weburl,
              googleMapsurl: casetaBuild.googleMapsurl,
              driveurl: casetaBuild.driveurl,
              owner: casetaBuild.owner,
              direction: casetaBuild.direction,
              telefono: casetaBuild.telefono,
              imagen: casetaBuild.imagen,
              name: casetaBuild.name,
              longitud: casetaBuild.longitud,
              latitud: casetaBuild.latitud,
            );
            infoMarkerBloc.add(OnChangeDataWindow(buildData));
            infoMarkerBloc.add(OnChangeCaseta(casetaBuild));
            infoMarkerBloc.add(const OnChangeViewInfo(true));
            infoMarkerBloc.add(const OnChangeTypeInfo(TypeInfo.caseta));
          });

      markers["MCCCS${caseta.id}"] = marker;
    });
    return markers;
  }

  static Future<Map<String, Marker>> comercialesMarcadores(
      List<CentroComercial> comerciales, InfoMarkerBloc infoMarkerBloc) async {
    final iconMarker = await getNetworkImageMarker(
        'https://res.cloudinary.com/da9xsfose/image/upload/v1715317489/qxob74xr0vfia8txozfu.png');
    Map<String, Marker> markers = {};

    comerciales.asMap().forEach((index, ccomercial) {
      final marker = Marker(
          // Todos Marcador Centro Comercial
          markerId: MarkerId("TMCC${ccomercial.id}"),
          icon: iconMarker,
          position: LatLng(ccomercial.latitud, ccomercial.longitud),
          onTap: () async {
            infoMarkerBloc.add(const OnChangeTypeInfo(TypeInfo.comercial));
            infoMarkerBloc.add(const OnChangeViewInfo(true));
            CentroComercial centroComercial = infoMarkerBloc
                .state.centrosComerciales
                .firstWhere((element) => element.id == ccomercial.id);
            DataWindow dataWindow = DataWindow(
              weburl: centroComercial.weburl,
              googleMapsurl: centroComercial.googleMapsurl,
              driveurl: centroComercial.driveurl,
              owner: centroComercial.owner,
              direction: centroComercial.direction,
              telefono: centroComercial.telefono,
              imagen: centroComercial.imagen,
              name: centroComercial.name,
              longitud: centroComercial.longitud,
              latitud: centroComercial.latitud,
            );
            infoMarkerBloc.add(OnChangeDataWindow(dataWindow));
          });
      markers["TMCC${ccomercial.id}"] = marker;
    });

    return markers;
  }

  // MARCADORES DE ENTRADAS
  static Future<Map<String, Marker>> entryMarkers(
      Map<String, LatLng> vectorTrabajo) async {
    Map<String, Marker> auxMapMarkers = {};
    final iconMarker = await getNetworkImageMarker(
        'https://res.cloudinary.com/da9xsfose/image/upload/v1703010266/dxtbt5xu4efhmgxqo0cu.png');

    vectorTrabajo.forEach((key, value) {
      String entrada = key.characters.last;

      final marker = Marker(
        markerId: MarkerId(key),
        position: value,
        icon: iconMarker,
        infoWindow: InfoWindow(
          title: 'Entrada $entrada',
        ),
      );

      auxMapMarkers[key] = marker;
    });

    return auxMapMarkers;
  }

  // MARCADORES REFERENCIALES NAME PASILLOS
  static Future<Map<String, Marker>> hallwayMarker(
      Map<String, LatLng> vectorTrabajo) async {
    List<String> keysPasillos = vectorTrabajo.keys.toList();
    Map<String, Marker> auxMarcadoresPasillos = {};

    for (var key in keysPasillos) {
      String idPasillo = key.characters.last;
      vectorTrabajo[key]!;
      final markerPasillo = Marker(
        markerId: MarkerId(key),
        position: vectorTrabajo[key]!,
        icon: await getCustomMarker("PASILLO $idPasillo"),
        infoWindow: InfoWindow(
          title: 'Pasillo $idPasillo',
        ),
      );
      auxMarcadoresPasillos[key] = markerPasillo;
    }
    return auxMarcadoresPasillos;
  }

  // POLILINEAS DE LOS PASILLOS
  static Future<Map<String, Polyline>> hallWays(
      Map<String, LatLng> vectorTrabajo) async {
    List<String> keysHallWay = vectorTrabajo.keys.toList();
    Map<String, Polyline> auxPolylineasPasillos = {};
    for (var i = 0; i < keysHallWay.length; i += 2) {
      final idPasillo = keysHallWay[i].substring(0, keysHallWay[i].length - 1);
      final polyline = Polyline(
          polylineId: PolylineId(idPasillo),
          points: [
            vectorTrabajo[keysHallWay[i]]!,
            vectorTrabajo[keysHallWay[i + 1]]!,
          ],
          color: Colors.black,
          width: 4,
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ]);
      auxPolylineasPasillos[idPasillo] = polyline;
    }
    return auxPolylineasPasillos;
  }
}
