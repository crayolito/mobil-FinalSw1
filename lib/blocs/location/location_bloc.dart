import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(lastKnownLocation: event.newLocation));
    });
    on<OnStartFollowingUser>(
        (event, emit) => emit(state.copyWith(isFolowingUser: true)));
    on<OnStopFollowingUser>(
        (event, emit) => emit(state.copyWith(isFolowingUser: false)));
  }

  Future<Position> getActualLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  void startFollowingUser() {
    add(const OnStartFollowingUser());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(
          LatLng(position.latitude, position.longitude)));
    });
  }

  Future<void> stopFolowwingUser() async {
    await positionStream!.cancel();
    add(const OnStartFollowingUser());
  }

  @override
  Future<void> close() {
    stopFolowwingUser();
    return super.close();
  }
}
