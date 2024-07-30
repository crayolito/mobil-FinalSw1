import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_marker_event.dart';
part 'info_marker_state.dart';

class InfoMarkerBloc extends Bloc<InfoMarkerEvent, InfoMarkerState> {
  InfoMarkerBloc() : super(InfoMarkerState()) {
    on<OnChangeTypeInfo>((event, emit) {
      emit(state.copyWith(typeInfo: event.typeInfo));
    });

    on<OnChangeViewInfo>((event, emit) {
      emit(state.copyWith(viewInfo: event.viewInfo));
    });

    on<OnChangeCentrosComerciales>((event, emit) async {
      emit(state.copyWith(centrosComerciales: centrosComerciales));
    });

    on<OnChangeCentroComercial>((event, emit) {
      emit(state.copyWith(centroComercial: event.centroComercial));
    });
    on<OnChangeCaseta>((event, emit) {
      emit(state.copyWith(caseta: event.caseta));
    });
    on<OnChangeIsCCequalDW>((event, emit) {
      emit(state.copyWith(isCCequalDW: event.isCCequalDW));
    });

    on<OnChangeDataWindow>((event, emit) {
      emit(state.copyWith(buildInfoWindow: event.dataWindow));
      if (event.dataWindow.name == state.centroComercial!.name) {
        add(const OnChangeIsCCequalDW(true));
      } else {
        add(const OnChangeIsCCequalDW(false));
      }
    });
  }
}
