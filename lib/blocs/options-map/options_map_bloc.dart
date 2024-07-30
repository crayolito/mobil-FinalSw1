import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'options_map_event.dart';
part 'options_map_state.dart';

class OptionsMapBloc extends Bloc<OptionsMapEvent, OptionsMapState> {
  OptionsMapBloc() : super(const OptionsMapState()) {
    on<OnChangeOptions>((event, emit) {
      emit(state.copyWith(options: event.options));
    });
    on<OnChangeDetailView>((event, emit) {
      emit(state.copyWith(detailView: event.detailView));
    });
    on<OnChangeDetailMap>((event, emit) {
      emit(state.copyWith(detailMap: event.detailMap));
    });
    on<OnChangeSearchPageMap>((event, emit) {
      emit(state.copyWith(isSeachPageMap: event.isSearchPageMap));
    });
  }
}
