import 'package:covoisenegal/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(const CovoitSenegalApp());
}

class CovoitSenegalApp extends StatelessWidget {
  const CovoitSenegalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
