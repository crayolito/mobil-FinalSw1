import 'package:app_sw1final/blocs/permissions/permissions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

swPersonalized(BuildContext context, PermissionsBloc permissionsBloc) {
  final size = MediaQuery.of(context).size;
  final decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.3,
          decoration: decoration,
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
                      estado: permissionsBloc.state.isGpsPermissionGranted,
                      onTap: () {
                        permissionsBloc.askGpsAccess();
                        Navigator.pop(context);
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
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
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
      );
    },
  );
}

class ButtonPermission extends StatelessWidget {
  const ButtonPermission(
      {super.key,
      required this.onTap,
      required this.titulo,
      required this.estado});

  final GestureTapCallback onTap;
  final String titulo;
  final bool estado;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    return Container(
      width: (size.width * 0.8) * 0.75,
      height: (size.height * 0.35) * 0.2,
      decoration: decoration,
      child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                estado ? Icons.check : FontAwesomeIcons.xmark,
                size: size.width * 0.1,
                color: estado ? const Color(0xFF00A541) : Colors.red,
              ),
              Text(titulo,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.anta(
                    fontSize: size.width * 0.07,
                    color: const Color(0xFF00A541),
                    fontWeight: FontWeight.w600,
                  )),
            ],
          )),
    );
  }
}
