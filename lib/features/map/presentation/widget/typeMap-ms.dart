import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/data/data.dart';
import 'package:app_sw1final/features/map/presentation/component/ButtonsDifApproaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TypeOfMap extends StatelessWidget {
  const TypeOfMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final decoration1 = BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 2.5),
      ),
    );
    final optionsMapBloc =
        BlocProvider.of<OptionsMapBloc>(context, listen: true);

    List<MapTypeOptions> mapTypeOptions1 = [
      MapTypeOptions(
          titulo: "Estándar",
          bandera: optionsMapBloc.state.detailMap == MapType.normal,
          imagen: "assets/imageIconos/mapaNormal.png",
          onTap: () {
            optionsMapBloc.add(const OnChangeDetailMap(MapType.normal));
          }),
      MapTypeOptions(
          titulo: "Satélite",
          bandera: optionsMapBloc.state.detailMap == MapType.satellite,
          imagen: "assets/imageIconos/mapaSatellite.png",
          onTap: () {
            optionsMapBloc.add(const OnChangeDetailMap(MapType.satellite));
          }),
      MapTypeOptions(
          titulo: "Terreno",
          bandera: optionsMapBloc.state.detailMap == MapType.terrain,
          imagen: "assets/imageIconos/mapaTerrain.png",
          onTap: () {
            optionsMapBloc.add(const OnChangeDetailMap(MapType.terrain));
          })
    ];
    List<MapTypeOptions> mapTypeOptions2 = [
      MapTypeOptions(
          titulo: "Híbrido",
          bandera: optionsMapBloc.state.detailMap == MapType.hybrid,
          imagen: "assets/imageIconos/mapaHybrid.png",
          onTap: () {
            optionsMapBloc.add(const OnChangeDetailMap(MapType.hybrid));
          }),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.025, vertical: size.height * 0.015),
      alignment: Alignment.topLeft,
      width: size.width,
      height: size.height * 0.45,
      decoration: decoration1,
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Tipo de Mapa",
              style: bodyMedium,
            ),
          ),
          ButtonsDifApproaches(
            listaButtons: mapTypeOptions1,
          ),
          ButtonsDifApproaches(
            listaButtons: mapTypeOptions2,
          ),
        ],
      ),
    );
  }
}
