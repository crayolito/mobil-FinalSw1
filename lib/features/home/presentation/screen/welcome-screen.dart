import 'package:animate_do/animate_do.dart';
import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: false);
    infoMarkerBloc.add(const OnChangeCentrosComerciales());
    Future.delayed(const Duration(seconds: 5), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => NextScreen()),
      // );
      Navigator.pushNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/imageScreen/welcome-screen.jpg"),
                fit: BoxFit.cover,
                opacity: 0.5)),
        child: FadeIn(
          animate: true,
          delay: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: size.width * 0.5,
                color: const Color(0xFF16DB65),
              ),
              Text(
                "Kawsay\nMarkt",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.1,
                  color: const Color(0xFF16DB65),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
