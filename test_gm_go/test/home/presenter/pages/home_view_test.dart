import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/home/presenter/pages/home_view.dart';

// Mock do HomeController
class MockHomeController extends Mock implements HomeController {}

void main() {
  late MockHomeController mockController;

  setUp(() {
    mockController = MockHomeController();
    // Registra o mock no GetIt
    getIt.registerSingleton<HomeController>(mockController);
  });

  tearDown(() {
    // Limpa o registro do GetIt após cada teste
    getIt.reset();
  });

  testWidgets('HomeView exibe corretamente', (tester) async {
    // Configuração do comportamento do mock
    when(() => mockController.capitalSelected).thenReturn('São Paulo');
    when(() => mockController.brazilStates).thenReturn(['São Paulo', 'Rio de Janeiro', 'Minas Gerais']);
    when(() => mockController.pageController).thenReturn(PageController());
    when(() => mockController.getMotels()).thenAnswer((_) async {});

    // Construção do widget com o mock
    await tester.pumpWidget(
      MaterialApp(
        home: HomeView(),
      ),
    );

    // Verificação se o DropdownButton está presente
    expect(find.byType(DropdownButton<String>), findsOneWidget);

    // Verificação se o FloatingActionButton está presente
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Verificação se o PageView está presente
    expect(find.byType(PageView), findsOneWidget);
  });
}
