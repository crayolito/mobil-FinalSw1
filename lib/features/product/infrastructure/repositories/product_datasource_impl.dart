import 'package:app_sw1final/features/product/domain/datasources/product_datasource.dart';
import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:app_sw1final/features/product/domain/repositories/product_repository.dart';
import 'package:app_sw1final/features/product/infrastructure/datasources/product_datasource_impl.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl({ProductDatasource? datasource})
      : datasource = datasource ?? ProductDatasourceImpl();

  @override
  Future<List<Producto>> getProducts() async {
    return await datasource.getProducts();
  }

  @override
  Future<List<Producto>> getProductoCaseta(String idCaseta) {
    // TODO: implement getProductoCaseta
    throw UnimplementedError();
  }

  @override
  Future<List<Producto>> procesarImagenIA(String imagen) async {
    return await datasource.procesarImagenIA(imagen);
  }
}
