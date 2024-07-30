import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/map/presentation/widget/body-iw.dart';
import 'package:app_sw1final/features/map/presentation/widget/fotter-iw.dart';
import 'package:app_sw1final/features/map/presentation/widget/header-piw.dart';
import 'package:app_sw1final/features/map/presentation/widget/header-siw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PInfoWindow extends StatelessWidget {
  const PInfoWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    DataWindow dataWindow = infoMarkerBloc.state.buildInfoWindow!;
    const decoration = BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(
          color: Colors.black,
          width: 4,
        )),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ));
    String nameOld = dataWindow.name;
    String nameNew = "";
    int i = nameOld.indexOf(' ', nameOld.indexOf(' ') + 1);
    if (i != -1) {
      nameNew = nameOld.replaceRange(
          i, i + 1, '\n'); // Reemplaza el segundo espacio con '\n'
    } else {
      nameNew = nameOld;
    }
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.3,
      maxChildSize: 0.96,
      builder: (context, scrollController) {
        return Container(
          decoration: decoration,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // 0.08
                const HeaderPIW(),
                // 0.13
                HeaderSIW(
                  titulo: nameNew,
                ),
                //  0.657
                BodyIW(
                  owner: dataWindow.owner,
                  direction: dataWindow.direction,
                  telefono: dataWindow.telefono,
                  image: dataWindow.imagen,
                ),
                FooterIW(
                  linkGoogleMaps: dataWindow.googleMapsurl,
                  linkFormulario: dataWindow.driveurl,
                  linkWeb: dataWindow.weburl,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
