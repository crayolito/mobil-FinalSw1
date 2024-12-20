import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/map/map_bloc.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:app_sw1final/helpers/cantidadTexto.dart';
import 'package:app_sw1final/shared/container-IconText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyIW extends StatefulWidget {
  const BodyIW(
      {super.key,
      required this.image,
      required this.owner,
      required this.direction,
      required this.telefono});

  final String owner;
  final String direction;
  final String telefono;
  final String image;

  @override
  State<BodyIW> createState() => _BodyIWState();
}

class _BodyIWState extends State<BodyIW> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duración de la animación
      vsync: this,
    )..repeat(reverse: true); // Repite la animación en reversa
  }

  @override
  void dispose() {
    _controller
        .dispose(); // No olvides deshacerte del controlador cuando ya no lo necesites
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> entradasLabel = ["A", "B", "C", "D", "E", "F", "G", "H"];
    final size = MediaQuery.of(context).size;
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final displayLarge = Theme.of(context).textTheme.displayLarge;
    final optionsMapBloc =
        BlocProvider.of<OptionsMapBloc>(context, listen: true);
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);
    return Material(
      child: SizedBox(
        height: size.height * 0.667,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // IMAGEN DEL CENTRO COMERCIAL O CASETA
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                  vertical: size.height * 0.02,
                ),
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover)),
              ),
              // INFORMACION BASICA COMERCIAL O CASETA
              SizedBox(
                width: size.width,
                child: Column(
                  children: [
                    DividerPersonal(),
                    ContainerIconText(
                        icon: FontAwesomeIcons.buildingUser,
                        heightGeneral: size.height * 0.07,
                        widthGeneral: size.width,
                        widthIcon: size.width * 0.15,
                        widthText: size.width * 0.85,
                        iconSize: 40,
                        textoFunction: cantidadText(
                            cantLineas: 2,
                            data1: widget.owner,
                            bodyText1: bodySmall,
                            bodyText2: bodySmall)),
                    DividerPersonal(),
                    ContainerIconText(
                        icon: FontAwesomeIcons.diamondTurnRight,
                        heightGeneral: size.height * 0.07,
                        widthGeneral: size.width,
                        widthIcon: size.width * 0.14,
                        widthText: size.width * 0.85,
                        iconSize: 40,
                        textoFunction: cantidadText(
                            cantLineas: 2,
                            data1: widget.direction,
                            bodyText1: bodySmall,
                            bodyText2: bodySmall)),
                    DividerPersonal(),
                    ContainerIconText(
                        icon: FontAwesomeIcons.phone,
                        heightGeneral: size.height * 0.07,
                        widthGeneral: size.width,
                        widthIcon: size.width * 0.15,
                        widthText: size.width * 0.85,
                        iconSize: 40,
                        textoFunction: cantidadText(
                            cantLineas: 2,
                            data1: widget.telefono,
                            bodyText1: bodySmall,
                            bodyText2: bodySmall)),
                    DividerPersonal(),
                  ],
                ),
              ),
              // ICONO ANIMATION
              infoMarkerBloc.state.typeInfo == TypeInfo.comercial &&
                      !infoMarkerBloc.state.isCCequalDW
                  ? Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 0.02,
                          vertical: size.height * 0.02),
                      height: size.height * 0.25,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "/home");
                            },
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, __) {
                                return Icon(
                                  FontAwesomeIcons.mobileScreenButton,
                                  shadows: shadowPPN3,
                                  size: size.width * 0.22 +
                                      (_controller.value *
                                          20), // Cambia el tamaño del icono de 80 a 100
                                );
                              },
                            ),
                          ),
                          Text(
                            "¿Quieres saber más sobre este centro comercial?\n!Presione¡ busca el de tu interes.",
                            textAlign: TextAlign.center,
                            style: bodySmall,
                          )
                        ],
                      ),
                    )
                  : Container(),
              infoMarkerBloc.state.typeInfo == TypeInfo.caseta
                  ? Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 0.01,
                          vertical: size.height * 0.01),
                      height: infoMarkerBloc.state.centroComercial!.subscription
                          ? size.height * 0.35
                          : size.height * 0.2,
                      width: size.width,
                      child: Column(
                        children: [
                          infoMarkerBloc.state.centroComercial!.subscription
                              ? Container(
                                  margin: EdgeInsets.only(
                                      bottom: size.height * 0.02),
                                  height: size.height * 0.13,
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Direccionamiento",
                                          style: bodySmall,
                                        ),
                                      ),
                                      Container(
                                        width: size.width,
                                        height: (size.height * 0.13) * 0.70,
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...entradasLabel.map((e) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    final mapBloc = BlocProvider
                                                        .of<MapBloc>(context);
                                                    mapBloc
                                                        .add(OnRutaCliente());
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: size.width * 0.07,
                                                    ),
                                                    padding: EdgeInsets.all(15),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                            blurRadius: 3,
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                          ),
                                                        ]),
                                                    child: Text(
                                                      e,
                                                      style: displayLarge,
                                                    ),
                                                  ),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  optionsMapBloc.add(const OnChangeOptions(
                                      MapOptions.product));
                                  Navigator.pushNamed(context, "/search");
                                },
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (_, __) {
                                    return Icon(
                                      FontAwesomeIcons.cartShopping,
                                      shadows: shadowPPN3,
                                      size: size.width * 0.22 +
                                          (_controller.value *
                                              20), // Cambia el tamaño del icono de 80 a 100
                                    );
                                  },
                                ),
                              ),
                              Text(
                                "¡¡Presione!! vea los productos pida informacion sobre el catalogo .",
                                textAlign: TextAlign.center,
                                style: bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container DividerPersonal() {
    return Container(
      height: 1.9,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
