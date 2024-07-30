import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/home/domain/datasources/home_datasource.dart';
import 'package:app_sw1final/features/home/domain/repositories/home_repository.dart';
import 'package:app_sw1final/features/home/infrastructure/datasources/home_datasource_impl.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl({HomeDatasource? datasource})
      : datasource = datasource ?? HomeDatasourceImpl();

  @override
  Future<List<CentroComercial>> getCentrosComerciales() async {
    return await datasource.getCentrosComerciales();
  }

  @override
  Future<List<LatLng>> getCoordPoligono(String idCentroComercial) async {
    return await datasource.getCoordPoligono(idCentroComercial);
  }

  @override
  Future<List<LatLng>> getEntradas(String idCentroComercial) async {
    return await datasource.getEntradas(idCentroComercial);
  }

  @override
  Future<List<Caseta>> getCasetas(String idCentroComercial) async {
    return await datasource.getCasetas(idCentroComercial);
  }
}
