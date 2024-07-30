import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/config/constants/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomsNavigationMap extends StatefulWidget {
  const BottomsNavigationMap({super.key});

  @override
  State<BottomsNavigationMap> createState() => _BottomsNavigationMapState();
}

class _BottomsNavigationMapState extends State<BottomsNavigationMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final optionsMapBloc = BlocProvider.of<OptionsMapBloc>(context);
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.92,
      left: size.width * .25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.65),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
                onPressed: () {
                  optionsMapBloc.add(const OnChangeOptions(MapOptions.product));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  shadows: shadowPPN2,
                  size: 35,
                )),
            IconButton(
                onPressed: () {
                  optionsMapBloc.add(const OnChangeOptions(MapOptions.store));
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  shadows: shadowPPN2,
                  size: 35,
                )),
            IconButton(
                onPressed: () {
                  optionsMapBloc.add(const OnChangeOptions(MapOptions.gps));
                },
                icon: const Icon(
                  Icons.gps_fixed,
                  color: Colors.black,
                  shadows: shadowPPN2,
                  size: 35,
                )),
          ]),
        ),
      ),
    );
  }
}
