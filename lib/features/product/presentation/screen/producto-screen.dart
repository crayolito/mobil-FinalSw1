import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ProductoScreen extends StatelessWidget {
  const ProductoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inforMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final productBloc = BlocProvider.of<ProductBloc>(context, listen: true);
    final displayLarge = Theme.of(context).textTheme.displayLarge;
    final displayMedium = Theme.of(context).textTheme.displayLarge;
    final headlineLarge = Theme.of(context).textTheme.displaySmall;
    final headlineMedium = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.4),
          ], stops: [
            0.1,
            0.9
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.036,
                ),
                child: Container(
                    width: size.width,
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                productBloc.state.producto!.image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.arrowLeft,
                                shadows: shadowPPN2,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.mapPin,
                                shadows: shadowPPN2,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                inforMarkerBloc
                                    .add(const OnChangeViewInfo(false));
                              },
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.025,
                  right: size.width * 0.025,
                ),
                margin: EdgeInsets.only(top: size.width * 0.12),
                width: size.width,
                height: size.height * 0.305,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(1, -0), // changes position of shadow
                      ),
                    ]),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.011,
                      ),
                      height: size.height * 0.07,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mochila resistente",
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: size.height * 0.01,
                      ),
                      // color: Colors.blue,
                      height: size.height * 0.07,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  '325.50 Bs',
                                  style: displayMedium,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02),
                                  width: size.width * 0.01,
                                  height: size.height * 0.03,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(0xFF00A541),
                                        width: 4,
                                      ),
                                      left: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "10%",
                                  style: headlineLarge,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 500),
                                        child: Center(
                                          child: Container(
                                            height: size.height * 0.197,
                                            width: size.width * 0.85,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.02,
                                                vertical: size.height * 0.02),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Color(0xFF00A541),
                                                width: 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Envios",
                                                    style: displayLarge,
                                                  ),
                                                ),
                                                Container(
                                                  width: size.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/imageIconos/uber.png"))),
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.1,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/imageIconos/deliveryCortez.png"),
                                                                )),
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/imageIconos/yango.png"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/imageIconos/misterDelivery.png"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/imageIconos/whatsapp.png"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                  });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5)),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.9)),
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: const Color(0xFF00A541),
                                  size: size.width * 0.07,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        height: size.height * 0.12,
                        width: size.width,
                        child: SingleChildScrollView(
                          child: ReadMoreText(
                              "Esta mochila inteligente redefine la funcionalidad con su diseño innovador y características tecnológicas. Equipada con un puerto de carga USB integrado, permite mantener tus dispositivos cargados en movimiento. Además, cuenta con un compartimento acolchado para portátiles y tabletas, protegiendo tus dispositivos electrónicos de golpes y rasguños. La mochila también incluye un sistema de bloqueo inteligente para mayor seguridad y bolsillos organizadores internos para mantener tus pertenencias ordenadas. Con su material resistente al agua, esta mochila inteligente es perfecta para el viajero moderno, el profesional en movimiento o el estudiante tecnológicamente avanzado.",
                              trimLines: 4,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Ver más',
                              trimExpandedText: 'Ver menos',
                              moreStyle: headlineMedium,
                              lessStyle: headlineMedium,
                              style: GoogleFonts.anta(
                                fontSize: size.width * 0.04,
                                color: Colors.black,
                              )),
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
