import 'package:app_sw1final/data/data.dart';
import 'package:app_sw1final/features/product/domain/entities/producto.dart';

abstract class ProductRepository {
  Future<List<Producto>> getProducts();
  Future<List<Producto>> getProductoCaseta(String idCaseta);
  Future<List<Producto>> procesarImagenIA(String imagen);
}
