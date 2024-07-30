part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class OnChangeProduct extends ProductEvent {
  final Producto producto;
  const OnChangeProduct(this.producto);
}

class OnChangeProductsCaseta extends ProductEvent {
  const OnChangeProductsCaseta();
}


class OnChangeStatusProcessIA extends ProductEvent {
  final StatusProccessIA statusProccessIA;
  const OnChangeStatusProcessIA(this.statusProccessIA);
}

class OnChangeStatusImage extends ProductEvent {
  final StatusImage statusImage;
  const OnChangeStatusImage(this.statusImage);
}

class OnChangeImageProducto extends ProductEvent {
  final String imagenProduto;
  const OnChangeImageProducto(this.imagenProduto);
}

class OnProcessCargaImagen extends ProductEvent {
  final String filePath;
  const OnProcessCargaImagen(this.filePath);
}

class OnProcessIA extends ProductEvent {
  final String texto;
  const OnProcessIA(this.texto);
}

class OnProcessGetProducts extends ProductEvent {
  const OnProcessGetProducts();
}

class OnChangedMessageIA extends ProductEvent {
  final String mensaje;
  const OnChangedMessageIA(this.mensaje);
}

class OnChangedViewClientProducts extends ProductEvent {
  final List<Producto> productos;
  const OnChangedViewClientProducts(this.productos);
}
