import 'package:app_sw1final/features/home/presentation/screen/home-screen.dart';
import 'package:app_sw1final/features/home/presentation/screen/welcome-screen.dart';
import 'package:app_sw1final/features/map/presentation/screen/map-screen.dart';
import 'package:app_sw1final/features/product/presentation/screen/camera-screen.dart';
import 'package:app_sw1final/features/product/presentation/screen/producto-screen.dart';
import 'package:app_sw1final/features/search/presentation/screen/search-screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const WelcomeScreen(),
  '/home': (context) => const HomeScreen(),
  '/map': (context) => const MapScreen(),
  '/search': (context) => const SearchScreen(),
  '/camera': (context) => const CameraScreen(),
  '/product': (context) => const ProductoScreen(),
};
