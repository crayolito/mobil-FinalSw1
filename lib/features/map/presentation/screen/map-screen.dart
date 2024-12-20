// ignore_for_file: unrelated_type_equality_checks

import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/location/location_bloc.dart';
import 'package:app_sw1final/blocs/map/map_bloc.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:app_sw1final/features/map/presentation/screen/infoWindow-screen.dart';
import 'package:app_sw1final/features/map/presentation/screen/map-loading-screen.dart';
import 'package:app_sw1final/features/map/presentation/widget/bottom-navigation-ms.dart';
import 'package:app_sw1final/features/map/presentation/widget/geo-navifation-ms.dart';
import 'package:app_sw1final/features/map/presentation/widget/map-view.dart';
import 'package:app_sw1final/features/map/presentation/widget/search-ms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  late InfoMarkerBloc infoMarkerBloc;
  late MapBloc mapBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    mapBloc = BlocProvider.of<MapBloc>(context);
    infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // OnCleanRutaPasada
    mapBloc.add(OnCleanRutaPasada());
    infoMarkerBloc.add(const OnChangeViewInfo(false));
    locationBloc.stopFolowwingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final optionsMapBloc = BlocProvider.of<OptionsMapBloc>(context);

    final initLocation = LatLng(infoMarkerBloc.state.centroComercial!.latitud,
        infoMarkerBloc.state.centroComercial!.longitud);
    return BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
      if (locationState.lastKnownLocation == null) {
        return const MapLoading();
      }

      return Stack(
        children: [
          BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              return MapView(
                initialLocation: initLocation,
                polygons: mapState.polygons.values.toSet(),
                markers: mapState.markers.values.toSet(),
                polylines: mapState.polylines.values.toSet(),
              );
            },
          ),
          // PARTE : SUPERIOR (SECTOR DE BUSQUEDA)
          BlocBuilder<OptionsMapBloc, OptionsMapState>(
              builder: (context, state) {
            if (state.options == MapOptions.product ||
                state.options == MapOptions.store) {
              return const BarSearch();
            }
            return SafeArea(
              child: FadeInDown(
                child: IconButton(
                    onPressed: () {
                      optionsMapBloc
                          .add(const OnChangeOptions(MapOptions.product));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.black,
                      shadows: shadowPPN2,
                      size: 35,
                    )),
              ),
            );
          }),
          // PARTE : INFERIOR
          BlocBuilder<OptionsMapBloc, OptionsMapState>(
              builder: (context, state) {
            if (state.options == MapOptions.product ||
                state.options == MapOptions.store) {
              return const BottomsNavigationMap();
            }
            return const GeoNavigationBar();
          }),
          // PARTE : VENTA DESPEGABLE INFORMACION CASETA O COMERCIAL
          BlocBuilder<InfoMarkerBloc, InfoMarkerState>(
            builder: (context, infoMarkerState) {
              if (infoMarkerState.viewInfo) {
                return FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: const PInfoWindow());
              }
              return Container();
            },
          )
        ],
      );
    });
  }
}
