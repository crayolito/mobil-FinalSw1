import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:app_sw1final/features/product/infrastructure/mappers/producto_mapper.dart';

class ProductosMapper {
  static List<Producto> fromJsonList(List<dynamic> jsonList) {
    List<Producto> productos = [];
    for (var item in jsonList) {
      productos.add(ProductoMapper.fromJson(item));
    }
    return productos;
  }
}
