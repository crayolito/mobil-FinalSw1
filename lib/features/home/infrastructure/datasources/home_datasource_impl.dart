import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/home/domain/datasources/home_datasource.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api-sw1.herokuapp.com',
    ),
  );

  @override
  Future<List<CentroComercial>> getCentrosComerciales() async {
    try {
      final response = await dio.request('/getCentrosComerciales',
          options: Options(method: 'GET'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // NOTE:  ESTRUCTURA DE  DATOS DE JSON A OBJETO
        List<CentroComercial> centrosComerciales = [];
        return centrosComerciales;
      } else {
        throw Exception('ERROR JSON A OBJETO O NO ES 200 201');
      }
    } catch (e) {
      throw Exception('Error al obtener los centros comerciales: $e');
    }
  }

  @override
  Future<List<LatLng>> getCoordPoligono(String idCentroComercial) async {
    try {
      final response = await dio.request('/',
          data: {"idCentroComercial": idCentroComercial},
          options: Options(method: 'POST'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // NOTE:  ESTRUCTURA DE  DATOS DE JSON A OBJETO
        List<LatLng> coordenadasPoligonoCC = [];
        return coordenadasPoligonoCC;
      } else {
        throw Exception('ERROR JSON A OBJETO O NO ES 200 201');
      }
    } catch (e) {
      throw Exception('Error al obtener los centros comerciales: $e');
    }
  }

  @override
  Future<List<LatLng>> getEntradas(String idCentroComercial) async {
    try {
      final response = await dio.request('/',
          data: {"idCentroComercial": idCentroComercial},
          options: Options(method: 'POST'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // NOTE:  ESTRUCTURA DE  DATOS DE JSON A OBJETO
        List<LatLng> coordenadasEntradas = [];
        return coordenadasEntradas;
      } else {
        throw Exception('ERROR JSON A OBJETO O NO ES 200 201');
      }
    } catch (e) {
      throw Exception('Error al obtener los centros comerciales: $e');
    }
  }

  @override
  Future<List<Caseta>> getCasetas(String idCentroComercial) async {
    try {
      final response = await dio.request('/getCentrosComerciales',
          options: Options(method: 'GET'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // NOTE:  ESTRUCTURA DE  DATOS DE JSON A OBJETO
        List<Caseta> casetas = [];
        return casetas;
      } else {
        throw Exception('ERROR JSON A OBJETO O NO ES 200 201');
      }
    } catch (e) {
      throw Exception('Error al obtener los centros comerciales: $e');
    }
  }
}
