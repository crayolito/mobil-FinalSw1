import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:app_sw1final/features/product/infrastructure/repositories/product_datasource_impl.dart';
import 'package:app_sw1final/helpers/camera-gallery-service-impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final productRepositoryImpl = ProductRepositoryImpl();

  ProductBloc() : super(ProductState()) {
    on<OnChangeProduct>((event, emit) {
      emit(state.copyWith(producto: event.producto));
    });

    on<OnProcessCargaImagen>((event, emit) async {
      var url = await CameraGalleryServiceImpl.uploadImageToCloudinary(
          event.filePath);
      emit(state.copyWith(
          imagenProducto: url ?? state.imagenProducto,
          statusImage: StatusImage.terminado));
    });

    on<OnChangeImageProducto>((event, emit) {
      emit(state.copyWith(imagenProducto: event.imagenProduto));
    });

    on<OnChangeStatusImage>((event, emit) {
      emit(state.copyWith(statusImage: event.statusImage));
    });

    on<OnChangeStatusProcessIA>((event, emit) {
      emit(state.copyWith(statusProccessIA: event.statusProccessIA));
    });

    on<OnProcessGetProducts>((event, emit) async {
      var productos = await productRepositoryImpl.getProducts();
      emit(state.copyWith(
        todosProductos: productos,
        viewClientProductos: productos,
      ));
    });

    on<OnChangedViewClientProducts>((event, emit) {
      emit(state.copyWith(viewClientProductos: event.productos));
    });

    on<OnProcessIA>((event, emit) async {
      var productos = await productRepositoryImpl.procesarImagenIA(event.texto);
      emit(state.copyWith(
          viewClientProductos: productos,
          mensageIA: "ESTAMOS PARA AYUDARRTE",
          statusProccessIA: StatusProccessIA.terminado));
    });
  }
}
