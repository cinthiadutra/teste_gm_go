import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_gm_go/home/presenter/pages/home_view.dart';
import 'package:test_gm_go/home/presenter/widget/image_grid_view.dart';
import 'package:test_gm_go/home/presenter/widget/image_selection_view.dart';
import 'package:test_gm_go/splash/splash_view.dart';
import 'package:test_gm_go/utils/routes_data/image_select_data.dart';
import 'package:test_gm_go/utils/routes_data/images_data.dart';

import '../home/data/models/suite.dart';
import '../home/presenter/pages/categorias_itens_view.dart';


class RoutesPath{
  static String root = '/'; // splash
  static String home = '/home';
  static String imageGrid = '/imageGrid';
  static String imageSelection = '/imageSelection';
  static String categorias = '/categorias';
}


class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[      
      GoRoute(
        path: RoutesPath.root,
        name: 'splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutesPath.home,
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RoutesPath.imageGrid,
        name: 'imageGrid',
        builder: (context, state) {
          final data = state.extra as GalleryData;
          return ImageGridView(imageUrls: data.images, suite: data.title,);
        }
      ),
      GoRoute(
        path: RoutesPath.imageSelection,
        name: RoutesPath.imageSelection,
        builder: (context, state) {
          final data = state.extra as ImageSelectData;
          return ImageSelectionView(data: data);
        }
      ),
      GoRoute(
        path: RoutesPath.categorias,
        name: RoutesPath.categorias,
        builder: (context, state) {
          return CategoriasItensView(entity: state.extra as Suite);
        }
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Página não encontrada.')),
    ),
  );
}
