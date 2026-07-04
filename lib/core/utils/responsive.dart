import 'package:flutter/material.dart';

class Responsive {
  /// Détection du type d'appareil
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  /// Largeur de l'écran
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Hauteur de l'écran
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Pourcentage de la largeur
  static double wp(BuildContext context, double percent) =>
      screenWidth(context) * percent / 100;

  /// Pourcentage de la hauteur
  static double hp(BuildContext context, double percent) =>
      screenHeight(context) * percent / 100;

  /// Taille de police responsive
  static double dp(BuildContext context, double size) {
    final width = screenWidth(context);

    if (isDesktop(context)) {
      return size * 1.2;
    } else if (isTablet(context)) {
      return size * 1.05;
    }
    return size;
  }
}
