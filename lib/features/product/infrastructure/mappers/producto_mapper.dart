import 'dart:math';

import 'package:app_sw1final/features/product/domain/entities/producto.dart';

class ProductoMapper {
  static Producto fromJson(Map<String, dynamic> json) {
    int descuento = Random().nextInt(99) + 1;
    return Producto(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra nulla. Fringilla urna porttitor rhoncus dolor purus non enim. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis.",
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        image: json['fotos'][0]['url'] ?? "",
        discount: descuento,
        createdAt: "");
  }
}
