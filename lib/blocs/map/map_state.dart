// ignore_for_file: must_be_immutable

part of 'map_bloc.dart';

enum MapStatus { loaded, processing, error }

class MapState extends Equatable {
  final bool processMap;
  final bool isMapInitialized;
  final bool followUser;

  // POLIGONOS PARA EL MAPA
  Map<String, Polyline> polylines;
  Map<String, Marker> markers;
  Map<String, Polygon> polygons;
  final MapStatus statusMap;

  MapState({
    this.processMap = false,
    this.isMapInitialized = false,
    this.followUser = false,
    Map<String, Marker>? markers,
    Map<String, Polyline>? polylines,
    Map<String, Polygon>? polygons,
    this.statusMap = MapStatus.loaded,
  })  : markers = markers ?? {},
        polylines = polylines ?? {},
        polygons = polygons ?? {};

  MapState copyWith({
    bool? processMap,
    bool? isMapInitialized,
    bool? followUser,
    Map<String, Marker>? markers,
    Map<String, Polyline>? polylines,
    Map<String, Polygon>? polygons,
    MapStatus? statusMap,
  }) {
    return MapState(
      processMap: processMap ?? this.processMap,
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      followUser: followUser ?? this.followUser,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      polygons: polygons ?? this.polygons,
      statusMap: statusMap ?? this.statusMap,
    );
  }

  

  @override
  List<Object> get props => [
        processMap,
        isMapInitialized,
        followUser,
        markers,
        polylines,
        polygons,
        statusMap,
      ];
}
