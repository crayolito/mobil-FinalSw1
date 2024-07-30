import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwiperPersonalized extends StatelessWidget {
  const SwiperPersonalized({
    super.key,
    required this.onIndexChanged,
  });

  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
      ),
      width: size.width,
      height: size.height * 0.65,
      child: Swiper(
        itemBuilder: (context, index) {
          final centroComercial =
              infoMarkerBloc.state.centrosComerciales[index];
          return ImageSwiper(image: centroComercial.imagen);
        },
        onIndexChanged: onIndexChanged,
        autoplay: true,
        itemCount: infoMarkerBloc.state.centrosComerciales.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}

class ImageSwiper extends StatelessWidget {
  const ImageSwiper({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          // spreadRadius: 0.5,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(image, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
