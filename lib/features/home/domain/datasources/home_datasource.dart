import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class HomeDatasource {
  Future<List<CentroComercial>> getCentrosComerciales();
  Future<List<LatLng>> getEntradas(String idCentroComercial);
  Future<List<LatLng>> getCoordPoligono(String idCentroComercial);
  Future<List<Caseta>> getCasetas(String idCentroComercial);
}
