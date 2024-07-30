import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:app_sw1final/blocs/location/location_bloc.dart';
import 'package:app_sw1final/blocs/map/map_bloc.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/blocs/permissions/helpers.dart';
import 'package:app_sw1final/blocs/permissions/permissions_bloc.dart';
import 'package:app_sw1final/blocs/product/product_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:app_sw1final/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

final internetChecker = CheckInternetConnection();

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (_) => PermissionsBloc()),
      BlocProvider(create: (_) => InfoMarkerBloc()),
      BlocProvider(create: (_) => LocationBloc()),
      BlocProvider(create: (_) => OptionsMapBloc()),
      BlocProvider(create: (_) => ProductBloc()),
      BlocProvider(
          create: (_) => MapBloc(
              infoMarkerBloc: BlocProvider.of<InfoMarkerBloc>(_),
              optionsMapBloc: BlocProvider.of<OptionsMapBloc>(_))),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      routes: appRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(
              bodyLarge: GoogleFonts.anta(
                fontSize: size.width * 0.083,
                color: Colors.black,
                fontWeight:
                    FontWeight.w700, // Hace que la fuente sea más gruesa
                shadows: shadowPP,
              ),
              bodyMedium: GoogleFonts.anta(
                fontSize: size.width * 0.07,
                color: Colors.black,
                fontWeight:
                    FontWeight.w500, // Hace que la fuente sea más gruesa
                shadows: shadowPP,
              ),
              bodySmall: GoogleFonts.anta(
                  fontSize: size.width * 0.055,
                  color: const Color(0xFF00A541),
                  fontWeight: FontWeight.w400),
              displayLarge: GoogleFonts.anta(
                  fontSize: size.width * 0.08,
                  color: const Color(0xFF00A541),
                  fontWeight: FontWeight.w400),
              displayMedium: GoogleFonts.anta(
                  fontSize: size.width * 0.055,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              displaySmall: GoogleFonts.anta(
                  fontSize: size.width * 0.08,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              headlineLarge: GoogleFonts.anta(
                fontSize: size.width * 0.05,
                color: Colors.black,
              ),
              headlineMedium: GoogleFonts.anta(
                fontSize: size.width * 0.05,
                color: const Color(0xFF00A541),
              ))),
    );
  }
}
