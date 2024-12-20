import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/config/constants/colors.const.dart';
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

class _CameraScreenState extends State<CameraScreen>
    with SingleTickerProviderStateMixin {
  ProductBloc? productBloc;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context, listen: false);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    productBloc!
        .add(const OnChangeImageProducto("assets/imageScreen/camara.gif"));
    productBloc!.add(const OnChangeStatusProcessIA(StatusProccessIA.empezando));
    productBloc!.add(const OnChangeStatusImage(StatusImage.empezando));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          color: kPrimaryColor.withOpacity(0.5),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
    final displayLarge = Theme.of(context).textTheme.displayLarge?.copyWith(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );

    final productBloc = BlocProvider.of<ProductBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/73/76/80/737680608cdc17fa138eebcdc3edebc3.jpg"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Stack(
          children: [
            // Título Superior con Animación
            Positioned(
              top: size.height * 0.05,
              left: 0,
              right: 0,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Colors.white,
                    kPrimaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds),
                child: Text(
                  "Búsqueda\nInteligente",
                  textAlign: TextAlign.center,
                  style: bodyLarge,
                ),
              ),
            ),

            // Contenedor de Imagen Principal con Animación
            Positioned(
              top: size.height * 0.2,
              right: size.width * 0.1,
              left: size.width * 0.1,
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) => Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: -5,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: productBloc.state.imagenProducto ==
                              "assets/imageScreen/camara.gif"
                          ? Image.asset('assets/imageScreen/camara.gif',
                              fit: BoxFit.cover)
                          : Image.network(productBloc.state.imagenProducto,
                              fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),

            // Panel de Control Inferior
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Botones de Control
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildControlButton(
                          icon: FontAwesomeIcons.camera,
                          onTap: () async {
                            final photoPath =
                                await CameraGalleryServiceImpl().takePhoto();
                            if (photoPath == null) return;
                            if (!context.mounted) return;
                            productBloc.add(OnProcessCargaImagen(
                                context: context, filePath: photoPath));
                          },
                        ),
                        _buildControlButton(
                          icon: Icons.collections,
                          onTap: () async {
                            showLoadingMessageCargaImagen(context);
                            final photoPath =
                                await CameraGalleryServiceImpl().selectPhoto();
                            if (photoPath == null) return;
                            if (!context.mounted) return;
                            productBloc.add(OnProcessCargaImagen(
                                context: context, filePath: photoPath));
                          },
                        ),
                        _buildControlButton(
                          icon: FontAwesomeIcons.arrowLeft,
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    // Botón Procesar
                    GestureDetector(
                      onTap: () => productBloc.add(OnProcessIA(context)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [kPrimaryColor, kCuartoColor],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.5),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text("PROCESAR", style: displayLarge),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, kCuartoColor],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
