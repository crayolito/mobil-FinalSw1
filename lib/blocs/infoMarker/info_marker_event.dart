part of 'info_marker_bloc.dart';

class InfoMarkerEvent extends Equatable {
  const InfoMarkerEvent();

  @override
  List<Object> get props => [];
}

class OnChangeTypeInfo extends InfoMarkerEvent {
  final TypeInfo typeInfo;
  const OnChangeTypeInfo(this.typeInfo);
}

class OnChangeViewInfo extends InfoMarkerEvent {
  final bool viewInfo;
  const OnChangeViewInfo(this.viewInfo);
}

class OnChangeCentrosComerciales extends InfoMarkerEvent {
  const OnChangeCentrosComerciales();
}

class OnChangeCasetas extends InfoMarkerEvent {
  const OnChangeCasetas();
}

class OnChangeCentroComercial extends InfoMarkerEvent {
  final CentroComercial centroComercial;
  const OnChangeCentroComercial(this.centroComercial);
}

class OnChangeCaseta extends InfoMarkerEvent {
  final Caseta caseta;
  const OnChangeCaseta(this.caseta);
}

class OnChangeDataWindow extends InfoMarkerEvent {
  final DataWindow dataWindow;
  const OnChangeDataWindow(this.dataWindow);
}

class OnChangeIsCCequalDW extends InfoMarkerEvent {
  final bool isCCequalDW;
  const OnChangeIsCCequalDW(this.isCCequalDW);
}
