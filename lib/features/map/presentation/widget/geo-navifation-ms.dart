import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/location/location_bloc.dart';
import 'package:app_sw1final/blocs/map/map_bloc.dart';
import 'package:app_sw1final/features/map/presentation/component/ButtonGeoNB.dart';
import 'package:app_sw1final/features/map/presentation/component/DetailsOfMall.dart';
import 'package:app_sw1final/features/map/presentation/widget/typeMap-ms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoNavigationBar extends StatefulWidget {
  const GeoNavigationBar({super.key});

  @override
  State<GeoNavigationBar> createState() => _GeoNavigationBarState();
}

class _GeoNavigationBarState extends State<GeoNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    return FadeInRight(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonGeoNB(
              onPressed: () {
                mapBloc.reorientMap();
              },
              iconP: FontAwesomeIcons.compass,
            ),
            ButtonGeoNB(
              onPressed: () {
                mapBloc.moveCameraMyLocation(
                    locationBloc.state.lastKnownLocation!);
              },
              iconP: Icons.gps_fixed_outlined,
            ),
            ButtonGeoNB(
              onPressed: () {
                double latitud = infoMarkerBloc.state.centroComercial!.latitud;
                double longitud =
                    infoMarkerBloc.state.centroComercial!.longitud;
                mapBloc.moveCameraMyLocation(LatLng(latitud, longitud));
              },
              iconP: Icons.location_on,
            ),
            ButtonGeoNB(
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top:
                              infoMarkerBloc.state.centroComercial!.subscription
                                  ? size.height * 0.2045
                                  : size.height * 0.5345,
                        ),
                        child: Material(
                          child: Container(
                            width: size.width,
                            color: Colors.white,
                            child: Column(
                              children: [
                                // TIPO DE MAPA
                                const TypeOfMap(),
                                // DETALLES DEL COMERCIAL
                                infoMarkerBloc
                                        .state.centroComercial!.subscription
                                    ? const DetailsOfMall()
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                iconP: Icons.auto_graph_rounded)
          ],
        ),
      ),
    );
  }
}
