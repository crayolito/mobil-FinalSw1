part of 'info_marker_bloc.dart';

enum TypeInfo { comercial, caseta }

// ignore: must_be_immutable
class InfoMarkerState extends Equatable {
  // CENTRO COMERCIALES Y COMERCIAL(ESPECIFICADO)
  List<CentroComercial> centrosComerciales = [];
  final CentroComercial? centroComercial;

  // CASETAS Y CASETA(ESPECIFICA)
  List<Caseta> casetas = [];
  final Caseta? caseta;

  // INFORMACION DATA(COMERCIAL O CASETA) Y TYPO DE INFO
  final bool viewInfo;
  final TypeInfo typeInfo;
  final DataWindow? buildInfoWindow;

  // Cliente selecciono : Centro Comercial
  // el centro comercial seleccionado es igual al centro comercia de la dataWindow (el marcador la ventanque le va mostrar la info)
  final bool isCCequalDW;

  InfoMarkerState(
      {this.viewInfo = false,
      this.isCCequalDW = false,
      this.typeInfo = TypeInfo.comercial,
      this.centroComercial,
      this.caseta,
      this.buildInfoWindow,
      List<CentroComercial>? centrosComerciales,
      List<Caseta>? casetas})
      : centrosComerciales = centrosComerciales ?? [],
        casetas = casetas ?? [];

  InfoMarkerState copyWith({
    bool? viewInfo,
    bool? isCCequalDW,
    TypeInfo? typeInfo,
    List<CentroComercial>? centrosComerciales,
    List<Caseta>? casetas,
    CentroComercial? centroComercial,
    Caseta? caseta,
    DataWindow? buildInfoWindow,
  }) =>
      InfoMarkerState(
        typeInfo: typeInfo ?? this.typeInfo,
        viewInfo: viewInfo ?? this.viewInfo,
        isCCequalDW: isCCequalDW ?? this.isCCequalDW,
        centrosComerciales: centrosComerciales ?? this.centrosComerciales,
        casetas: casetas ?? this.casetas,
        centroComercial: centroComercial ?? this.centroComercial,
        caseta: caseta ?? this.caseta,
        buildInfoWindow: buildInfoWindow ?? this.buildInfoWindow,
      );

  @override
  List<Object?> get props => [
        typeInfo,
        viewInfo,
        centrosComerciales,
        casetas,
        centroComercial,
        caseta,
        buildInfoWindow,
        isCCequalDW
      ];
}
