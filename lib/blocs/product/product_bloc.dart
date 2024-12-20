import 'package:app_sw1final/config/constants/dialog.const.dart';
import 'package:app_sw1final/data/data-auxiliar.dart';
import 'package:app_sw1final/features/product/domain/entities/producto.dart';
import 'package:app_sw1final/features/product/infrastructure/repositories/product_datasource_impl.dart';
import 'package:app_sw1final/helpers/camera-gallery-service-impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final productRepositoryImpl = ProductRepositoryImpl();

  ProductBloc() : super(ProductState()) {
    on<OnChangeProduct>((event, emit) {
      emit(state.copyWith(producto: event.producto));
    });

    on<OnProcessCargaImagen>((event, emit) async {
      try {
        // Validar que tengamos contexto
        if (event.filePath.isEmpty) {
          DialogService.showErrorSnackBar(
            message: 'Por favor selecciona una imagen para continuar',
            context: event.context,
          );
          return;
        }

        // Mostrar diálogo de carga
        DialogService.showLoadingDialog(
          context: event.context,
          message: 'Subiendo imagen...',
        );

        // Subir imagen con timeout
        final url = await CameraGalleryServiceImpl.uploadImageToCloudinary(
          event.filePath,
        );

        if (url == null || url.isEmpty) {
          if (event.context.mounted) {
            // Cerrar diálogo de carga
            Navigator.of(event.context).pop();

            DialogService.showErrorSnackBar(
              message:
                  'No pudimos subir tu imagen. Por favor intenta nuevamente',
              context: event.context,
            );
          }
          return;
        }

        if (!event.context.mounted) return;
        // Cerrar diálogo de carga
        Navigator.of(event.context).pop();

        // Emitir estado exitoso
        emit(state.copyWith(
          imagenProducto: url,
          statusImage: StatusImage.terminado,
        ));

        // Mostrar mensaje de éxito
        DialogService.showSuccessSnackBar(
          'Tu imagen se ha subido correctamente',
          event.context,
        );
      } catch (error) {
        // Cerrar diálogo de carga si está abierto
        if (Navigator.canPop(event.context)) {
          Navigator.of(event.context).pop();
        }

        // Mostrar mensaje amigable al usuario
        DialogService.showErrorSnackBar(
          message:
              'Hubo un problema al subir tu imagen. Por favor intenta nuevamente',
          context: event.context,
        );
      }
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
      try {
        // Validar que tengamos contexto
        if (!event.context.mounted) {
          return;
        }

        // Validar que tengamos una imagen para procesar
        if (state.imagenProducto.isEmpty) {
          DialogService.showErrorSnackBar(
            message: 'Por favor, primero sube una imagen para analizarla',
            context: event.context,
          );
          return;
        }

        // Mostrar diálogo de carga personalizado para IA
        DialogService.showLoadingDialog(
          context: event.context,
          message: 'Analizando imagen ...',
        );

        // Actualizar estado a procesando
        emit(state.copyWith(statusProccessIA: StatusProccessIA.procesando));

        // Procesar imagen con IA
        final productos =
            await productRepositoryImpl.procesarImagenIA(state.imagenProducto);

        // Validar respuesta
        if (productos.isEmpty) {
          // Cerrar diálogo de carga
          if (!event.context.mounted) return;
          Navigator.of(event.context).pop();

          DialogService.showErrorSnackBar(
            message:
                'No pudimos analizar la imagen. Por favor intenta con otra imagen',
            context: event.context,
          );
          return;
        }

        // Cerrar diálogo de carga
        if (!event.context.mounted) return;
        Navigator.of(event.context).pop();

        // Emitir estado exitoso
        emit(state.copyWith(
          viewClientProductos: productos,
          statusProccessIA: StatusProccessIA.terminado,
        ));

        // Mostrar mensaje de éxito
        DialogService.showSuccessSnackBar(
          'Análisis completado exitosamente',
          event.context,
        );
      } catch (error) {
        // Cerrar diálogo de carga si está abierto
        if (Navigator.canPop(event.context)) {
          Navigator.of(event.context).pop();
        }

        // Mostrar mensaje amigable al usuario
        DialogService.showErrorSnackBar(
          message:
              'Hubo un problema al analizar la imagen. Por favor intenta nuevamente',
          context: event.context,
        );
      }
    });
  }
}
