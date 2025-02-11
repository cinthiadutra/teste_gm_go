import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_gm_go/config/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Inicializando o AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    // Configurando a animação de escala
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).go(RoutesPath.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: SvgPicture.network(
              'https://go.guiademoteis.com.br/assets/images/logo-banner.svg', 
              height: 150, 
            ),
          ),
        ),
      ),
    );
  }
}
