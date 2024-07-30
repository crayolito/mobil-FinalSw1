import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/helpers/camera-gallery-service-impl.dart';
import 'package:app_sw1final/shared/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  ProductBloc? productBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context, listen: false);
  }

  @override
  void dispose() {
    productBloc!
        .add(const OnChangeImageProducto("assets/imageScreen/camara.gif"));
    productBloc!.add(const OnChangeStatusProcessIA(StatusProccessIA.empezando));
    productBloc!.add(const OnChangeStatusImage(StatusImage.empezando));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final displayLarge = Theme.of(context).textTheme.displayLarge;
    final productBloc = BlocProvider.of<ProductBloc>(context, listen: true);

    const decoration1 = BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/73/76/80/737680608cdc17fa138eebcdc3edebc3.jpg"),
            fit: BoxFit.cover,
            opacity: 0.6));

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: decoration1,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.3,
              child: Text(
                "Busqueda\nInteligente",
                style: bodyLarge,
              ),
            ),
            Positioned(
                top: size.height * 0.2,
                right: size.width * 0.1,
                left: size.width * 0.1,
                child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: productBloc.state.imagenProducto ==
                          "assets/imageScreen/camara.gif"
                      ? Image.asset('assets/imageScreen/camara.gif',
                          fit: BoxFit.cover) // Usa Image.asset para AssetImage
                      : Image.network(productBloc.state.imagenProducto,
                          fit: BoxFit.cover),
                )),
            Positioned(
                top: size.height * 0.74,
                child: Container(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: size.width * 0.06),
                        margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                showLoadingMessageCargaImagen(context);
                                final photoPath =
                                    await CameraGalleryServiceImpl()
                                        .takePhoto();
                                if (photoPath == null) return;
                                productBloc
                                    .add(OnProcessCargaImagen(photoPath));
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.camera,
                                  color: const Color(0xFF00A541),
                                  // shadows: shadowPP,
                                  size: 35,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                showLoadingMessageCargaImagen(context);
                                final photoPath =
                                    await CameraGalleryServiceImpl()
                                        .selectPhoto();
                                if (photoPath == null) return;
                                productBloc
                                    .add(OnProcessCargaImagen(photoPath));
                              },
                              child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.collections,
                                  color: const Color(0xFF00A541),
                                  // shadows: shadowPP,
                                  size: 35,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: const Color(0xFF00A541),
                                  // shadows: shadowPP,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async {
                            String image = productBloc.state.imagenProducto;
                            showLoadingMessageIA(context);
                            productBloc.add(OnProcessIA(image));
                          },
                          child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              "Procesar",
                              style: displayLarge,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
