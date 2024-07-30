import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/home/presentation/widget/header-hs.dart';
import 'package:app_sw1final/features/home/presentation/widget/swiperPersonalized-hs.dart';
import 'package:app_sw1final/shared/buttonPIconText.dart';
import 'package:app_sw1final/shared/buttonPText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int indexCC = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);

    return Positioned(
      top: 0,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: size.height * 0.12,
            width: size.width,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPIconText(
                    icon: Icons.menu,
                    onTap: () {},
                  ),
                  ButtonPIconText(
                    icon: FontAwesomeIcons.info,
                    onTap: widget.onTap,
                  ),
                ],
              ),
            ),
          ),
          // Titulo de Centros Comerciales
          Header(
            titulo: infoMarkerBloc.state.centrosComerciales[indexCC].name,
          ),
          // Imagenes de Centros Comerciales
          SwiperPersonalized(
            onIndexChanged: (value) {
              setState(() {
                indexCC = value;
              });
            },
          ),
          // Presionar para ir Ver Centro Comercial
          ButtonPText(
            onTap: () {
              CentroComercial centroComercial =
                  infoMarkerBloc.state.centrosComerciales[indexCC];
              infoMarkerBloc.add(OnChangeCentroComercial(centroComercial));
              Navigator.pushNamed(context, "/map");
            },
          )
        ],
      ),
    );
  }
}
