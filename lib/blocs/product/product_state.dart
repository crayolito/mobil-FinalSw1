part of 'product_bloc.dart';

enum StatusProccessIA { empezando, procesando, terminado }

enum StatusImage { empezando, procesando, terminado }

// ignore: must_be_immutable
class ProductState extends Equatable {
  final StatusProccessIA statusProccessIA;
  final StatusImage statusImage;
  final String imagenProducto;
  final String mensageIA;

  List<Producto> todosProductos = [];
  List<Producto> viewClientProductos = [];
  final Producto? producto;

  List<Caseta> casetasComercialSelect;
  List<Producto> productosCaseta = [];

  ProductState({
    this.statusProccessIA =
        StatusProccessIA.empezando, // Inicialización directa
    this.statusImage = StatusImage.empezando, // Inicialización directa
    this.imagenProducto =
        "assets/imageScreen/camara.gif", // Inicialización directa
    this.mensageIA =
        "Se esta procesando su buqueda ...", // Inicialización directa
    List<Producto>? productosCaseta,
    List<Caseta>? casetasComercialSelect,
    this.producto,
    List<Producto>? todosProductos,
    List<Producto>? viewClientProductos,
  })  : productosCaseta = productosCaseta ?? [],
        casetasComercialSelect = casetasComercialSelect ?? [],
        todosProductos = todosProductos ?? [],
        viewClientProductos = viewClientProductos ?? [];

  ProductState copyWith({
    List<Producto>? productosCaseta,
    List<Caseta>? casetasComercialSelect,
    Producto? producto,
    StatusProccessIA? statusProccessIA,
    StatusImage? statusImage,
    String? imagenProducto,
    String? mensageIA,
    List<Producto>? todosProductos,
    List<Producto>? viewClientProductos,
  }) {
    return ProductState(
      todosProductos: todosProductos ?? this.todosProductos,
      viewClientProductos: viewClientProductos ?? this.viewClientProductos,
      statusProccessIA: statusProccessIA ?? this.statusProccessIA,
      statusImage: statusImage ?? this.statusImage,
      imagenProducto: imagenProducto ?? this.imagenProducto,
      mensageIA: mensageIA ?? this.mensageIA,
      productosCaseta: productosCaseta ?? this.productosCaseta,
      casetasComercialSelect:
          casetasComercialSelect ?? this.casetasComercialSelect,
      producto: producto ?? this.producto,
    );
  }

  @override
  List<Object?> get props => [
        todosProductos,
        viewClientProductos,
        statusProccessIA,
        statusImage,
        imagenProducto,
        mensageIA,
        productosCaseta,
        casetasComercialSelect,
        producto
      ];
}
