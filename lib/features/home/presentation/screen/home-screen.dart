import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/permissions/permissions_bloc.dart';
import 'package:app_sw1final/features/home/presentation/widget/body-hs.dart';
import 'package:app_sw1final/features/home/presentation/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool viewPermission = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido Principal
          Body(
            onTap: () {
              setState(() {
                viewPermission = true;
              });
            },
          ),
          // Mensaje de Permisos
          viewPermission
              ? ViewPermissions(
                  onTap: () {
                    setState(() {
                      viewPermission = false;
                    });
                  },
                )
              : Container()
        ],
      ),
    );
  }
}

class ViewPermissions extends StatelessWidget {
  const ViewPermissions({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final permissionsBloc =
        BlocProvider.of<PermissionsBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final decoration1 = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    );
    final decoration2 = BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(20),
    );
    return Positioned(
        top: 0,
        child: FadeIn(
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Container(
                width: size.width * 0.7,
                height: size.height * 0.3,
                decoration: decoration1,
                child: Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.02,
                        vertical: size.height * 0.01,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonPermission(
                            estado:
                                permissionsBloc.state.isGpsPermissionGranted,
                            onTap: () {
                              permissionsBloc.askGpsAccess();
                            },
                            titulo: "Acceso GPS",
                          ),
                          ButtonPermission(
                            estado: permissionsBloc.state.isGpsEnabled,
                            onTap: () {},
                            titulo: "Estado GPS",
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: (size.width * 0.8) * 0.5,
                            height: (size.height * 0.35) * 0.2,
                            decoration: decoration2,
                            child: GestureDetector(
                                onTap: onTap,
                                child: Text("Cerrar",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.anta(
                                      fontSize: size.width * 0.07,
                                      color: const Color(0xFF00A541),
                                      fontWeight: FontWeight.w600,
                                    ))),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ));
  }
}
