part of 'options_map_bloc.dart';

//Optiones Map
enum MapOptions { product, store, gps }

//Detalles del centro comercial
enum DetailCC { pasillo, entrada, completo }

//Detalles del Mapa
// enum DetailMap { normal, hybrid, satellite, terrain

class OptionsMapState extends Equatable {
  final MapOptions options;
  final DetailCC detailView;
  final MapType detailMap;

  // USO EL BUSCADOR DE OPCIONES DEL MAPA : TRUE
  // USO EL BUSCADOR DEL MARCADOR(CASETA) : FALSO
  final bool isSeachPageMap;

  const OptionsMapState({
    this.isSeachPageMap = false,
    this.options = MapOptions.product,
    this.detailView = DetailCC.entrada,
    this.detailMap = MapType.normal,
  });

  OptionsMapState copyWith({
    bool? isSeachPageMap,
    MapOptions? options,
    DetailCC? detailView,
    MapType? detailMap,
  }) {
    return OptionsMapState(
      isSeachPageMap: isSeachPageMap ?? this.isSeachPageMap,
      options: options ?? this.options,
      detailView: detailView ?? this.detailView,
      detailMap: detailMap ?? this.detailMap,
    );
  }

  @override
  List<Object> get props => [
        isSeachPageMap,
        options,
        detailView,
        detailMap,
      ];
}
