import 'package:app_sw1final/blocs/map/map_bloc.dart';
import 'package:app_sw1final/blocs/options-map/options_map_bloc.dart';
import 'package:app_sw1final/data/data.dart';
import 'package:app_sw1final/features/map/presentation/component/ButtonsDifApproaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsOfMall extends StatelessWidget {
  const DetailsOfMall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    final optionsMapBloc =
        BlocProvider.of<OptionsMapBloc>(context, listen: true);
    List<MapTypeOptions> mapTypeOptions = [
      MapTypeOptions(
          titulo: "Entrada",
          bandera: optionsMapBloc.state.detailView == DetailCC.entrada,
          imagen: "assets/imageIconos/entrada.png",
          onTap: () {
            mapBloc.add(const OnChangedMapClean());

            mapBloc.add(const OnChangedDetailsCC(DetailCC.entrada));
          }),
      MapTypeOptions(
          titulo: "Pasillo",
          bandera: optionsMapBloc.state.detailView == DetailCC.pasillo,
          imagen: "assets/imageIconos/calle.png",
          onTap: () {
            mapBloc.add(const OnChangedMapClean());

            mapBloc.add(const OnChangedDetailsCC(DetailCC.pasillo));
          }),
      MapTypeOptions(
          titulo: "Terreno",
          bandera: optionsMapBloc.state.detailView == DetailCC.completo,
          imagen: "assets/imageIconos/todasCpas.png",
          onTap: () {
            mapBloc.add(const OnChangedMapClean());

            mapBloc.add(const OnChangedDetailsCC(DetailCC.completo));
          })
    ];

    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025, vertical: size.height * 0.015),
        alignment: Alignment.topLeft,
        width: size.width,
        height: size.height * 0.26,
        child: Column(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Detalles del Comercial",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ButtonsDifApproaches(listaButtons: mapTypeOptions)
        ]));
  }
}
