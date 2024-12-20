import 'package:app_sw1final/features/product/domain/datasources/product_datasource.dart';
import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:app_sw1final/features/product/infrastructure/mappers/productos_mappers.dart';
import 'package:dio/dio.dart';

class ProductDatasourceImpl extends ProductDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://143.198.56.179:3000/api',
    ),
  );

  @override
  Future<List<Producto>> getProductoCaseta(String idCaseta) {
    // TODO: implement getProductoCaseta
    throw UnimplementedError();
  }

  @override
  Future<List<Producto>> getProducts() async {
    try {
      var response = await dio.request('/products?limit=100&offset=0',
          options: Options(method: 'GET', responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final structureData = ProductosMapper.fromJsonList(response.data);
        return structureData;
      } else {
        throw Exception(
            'No fue una respuesta 200 o Fue un error a la hora de convertirlo en Objeto');
      }
    } catch (e) {
      throw Exception('Error al obtener los Productos');
    }
  }

  @override
  Future<List<Producto>> procesarImagenIA(String imagen) async {
    try {
      var response = await dio.request('/products/search-products',
          options: Options(method: 'POST', responseType: ResponseType.json),
          data: {
            'imageUrl': imagen
          }); // Aquí se envía la imagen como parte de la data
      if (response.statusCode == 200 || response.statusCode == 201) {
        final structureData = ProductosMapper.fromJsonList(response.data);
        return structureData;
      } else {
        throw Exception(
            'No fue una respuesta 200 o Fue un error a la hora de convertirlo en Objeto');
      }
    } catch (e) {
      throw Exception('Error al obtener los Productos');
    }
  }
}
