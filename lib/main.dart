import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:pizza/core/config/routes/app_routes.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp(
    appRouter: AppRouter(),
  )));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}