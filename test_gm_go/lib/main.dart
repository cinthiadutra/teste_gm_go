import 'package:flutter/material.dart';

import 'package:test_gm_go/config/injector.dart';
import 'package:test_gm_go/config/routes.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: Routes.router.routerDelegate,
      routeInformationParser: Routes.router.routeInformationParser,
      routeInformationProvider: Routes.router.routeInformationProvider,
      title: 'Guia de Moteis 2.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}