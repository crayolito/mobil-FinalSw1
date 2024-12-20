import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteCalculator {
  /// Calcula el costo total del camino basado en múltiples factores
  /// C(p) = Σ(di x fi x ai x ni)
  double calculateOptimalRoute(List<LatLng> puntosTrabajos) {
    double costoTotal = 0.0;

    // Iterar sobre los segmentos del camino
    for (int i = 0; i < puntosTrabajos.length - 1; i++) {
      // Calcular la distancia entre puntos consecutivos
      double di = _calculateDistance(puntosTrabajos[i], puntosTrabajos[i + 1]);

      // Factores que podrían variar según el contexto
      double fi = 1.0; // Factor de personas (1-5)
      double ai = 0.8; // Factor de accesibilidad (0.5-1)
      double ni = 1.0; // Factor de cambio de nivel (1 mismo nivel, 1.5 cambio)

      // Calcular costo del segmento
      double costoSegmento = di * fi * ai * ni;
      costoTotal += costoSegmento;
    }

    return costoTotal;
  }

  /// Calcula el índice de complejidad de la ruta
  /// ICR = (Nc x Pc) + (Ne x Pe) + (Nt x Pt)
  double calculateRouteComplexityIndex(List<LatLng> puntosTrabajos) {
    // Análisis de la ruta para determinar cambios
    int nc = _countDirectionChanges(
        puntosTrabajos); // Número de cambios de dirección
    int ne =
        _countElevationChanges(puntosTrabajos); // Número de escaleras/rampas
    int nt = _countAreaTransitions(
        puntosTrabajos); // Número de transacciones entre áreas

    // Pesos definidos según la fórmula
    const double pc = 0.1; // Peso por cambio de dirección
    const double pe = 0.3; // Peso por escaleras/rampas
    const double pt = 0.2; // Peso por tipo de transición

    // Cálculo del índice de complejidad
    return (nc * pc) + (ne * pe) + (nt * pt);
  }

  // Métodos auxiliares
  double _calculateDistance(LatLng point1, LatLng point2) {
    const double earthRadius = 6371000; // Radio de la Tierra en metros

    // Convertir a radianes
    double lat1 = point1.latitude * pi / 180;
    double lat2 = point2.latitude * pi / 180;
    double dLat = (point2.latitude - point1.latitude) * pi / 180;
    double dLon = (point2.longitude - point1.longitude) * pi / 180;

    // Fórmula de Haversine
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  int _countDirectionChanges(List<LatLng> points) {
    if (points.length < 3) return 0;

    int changes = 0;
    for (int i = 0; i < points.length - 2; i++) {
      double angle = _calculateAngle(points[i], points[i + 1], points[i + 2]);
      if (angle > 30) {
        // Considera un cambio si el ángulo es mayor a 30 grados
        changes++;
      }
    }
    return changes;
  }

  double _calculateAngle(LatLng p1, LatLng p2, LatLng p3) {
    double bearing1 = _calculateBearing(p1, p2);
    double bearing2 = _calculateBearing(p2, p3);

    double angle = (bearing2 - bearing1).abs();
    if (angle > 180) {
      angle = 360 - angle;
    }
    return angle;
  }

  double _calculateBearing(LatLng start, LatLng end) {
    double lat1 = start.latitude * pi / 180;
    double lat2 = end.latitude * pi / 180;
    double dLon = (end.longitude - start.longitude) * pi / 180;

    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double bearing = atan2(y, x);

    return (bearing * 180 / pi + 360) % 360;
  }

  int _countElevationChanges(List<LatLng> points) {
    // Este método necesitaría datos de elevación adicionales
    // Por ahora retorna un valor simulado basado en la distancia
    return (points.length / 5).floor();
  }

  int _countAreaTransitions(List<LatLng> points) {
    // Este método necesitaría información adicional sobre áreas
    // Por ahora retorna un valor simulado
    return (points.length / 4).floor();
  }
}
