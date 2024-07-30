import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterIW extends StatelessWidget {
  const FooterIW(
      {super.key,
      required this.linkGoogleMaps,
      required this.linkFormulario,
      required this.linkWeb});

  final String linkGoogleMaps;
  final String linkFormulario;
  final String linkWeb;

  @override
  Widget build(BuildContext context) {
    double latitud = 0;
    double longitud = 0;

    final displayLarge = Theme.of(context).textTheme.displayLarge;
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final size = MediaQuery.of(context).size;

    if (infoMarkerBloc.state.typeInfo == TypeInfo.caseta) {
      latitud =
          double.parse(infoMarkerBloc.state.caseta!.latitud.toStringAsFixed(6));
      longitud = double.parse(
          infoMarkerBloc.state.caseta!.longitud.toStringAsFixed(6));
    } else {
      latitud = double.parse(
          infoMarkerBloc.state.centroComercial!.latitud.toStringAsFixed(6));
      longitud = double.parse(
          infoMarkerBloc.state.centroComercial!.longitud.toStringAsFixed(6));
    }

    return Container(
      height: size.height * 0.08,
      width: size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 4,
          offset: const Offset(
            0,
            -4,
          ),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SocialMediaButton(
            icon: FontAwesomeIcons.mapPin,
            onPressed: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: Center(
                          child: Container(
                            height: size.height * 0.197,
                            width: size.width * 0.7,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF00A541),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Cómo llegar?",
                                    style: displayLarge,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "moovit://nearby?lat=${latitud}&lon=${longitud}&partner_id=UAGRM"));
                                        },
                                        child: Container(
                                          height: size.height * 0.07,
                                          width: size.width * 0.13,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/imageIconos/moovit.png"))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          // CRUZERO
                                          await launchUrl(Uri.parse(
                                              "https://play.google.com/store/apps/details?id=com.mos&pcampaignid=web_share"));
                                        },
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: size.width * 0.13,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/imageIconos/cruzero.png"),
                                              )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          //GOOGLE MAP
                                          await launchUrl(Uri.parse(
                                              "https://www.google.com/maps/search/?api=1&query=${latitud},${longitud}"));
                                        },
                                        child: Container(
                                          height: size.height * 0.07,
                                          width: size.width * 0.12,
                                          decoration: BoxDecoration(
                                              // shape: BoxShape.circle,
                                              // color: Colors.black,
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/imageIconos/mapGoogle.png"),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  });
              // moovit://nearby?lat=40.758896&lon=-73.985130&partner_id=UAGRM
              // await launchUrl(Uri.parse(linkGoogleMaps));

              // CRUZERO
              // await launchUrl(Uri.parse(
              //     "https://play.google.com/store/apps/details?id=com.mos&pcampaignid=web_share"));

              //GOOGLE MAP
              // await launchUrl(Uri.parse(
              //     "https://www.google.com/maps/search/?api=1&query=-17.754299,-63.199149"));

              // MOVVIT
              // await launchUrl(Uri.parse(
              //     "moovit://nearby?lat=-17.754299&lon=-63.199149&partner_id=UAGRM"));
            },
          ),
          SocialMediaButton(
            icon: FontAwesomeIcons.fileSignature,
            onPressed: () async {
              await launchUrl(Uri.parse(linkFormulario));
            },
          ),
          SocialMediaButton(
            icon: FontAwesomeIcons.chrome,
            onPressed: () async {
              await launchUrl(Uri.parse(linkWeb));
            },
          ),
        ],
      ),
    );
  }
}

// Boton de Redes Sociales
class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const SocialMediaButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(
          size.width * 0.02,
        ),
        height: size.height * 0.065,
        width: size.width * 0.3,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                offset: const Offset(0, 0),
              ),
            ]),
        child: Icon(
          icon,
          color: Colors.white,
          shadows: shadowPP,
          size: 27,
        ),
      ),
    );
    // IconButton(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all(Colors.black),
    //     ),
    //     onPressed: onPressed,
    //     icon: Icon(
    //       icon,
    //       color: Colors.white,
    //       shadows: shadowPPN2,
    //       size: 35,
    //     ));
  }
}
