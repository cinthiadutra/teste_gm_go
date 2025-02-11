import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/data/models/result_state.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/home/presenter/pages/go_now_view.dart';

// Mock do HomeController
class MockHomeController extends Mock implements HomeController {}

void main() {
  late MockHomeController mockController;

  setUp(() {
    mockController = MockHomeController();
  });

  testWidgets('GoNowView exibe motéis corretamente', (tester) async {
    // Configuração do comportamento do mock
    when(() => mockController.listAll).thenReturn(ValueNotifier(ResultState<List<Motel>>(running: true)));
    when(() => mockController.getMotels()).thenAnswer((_) async {
      // Simula a obtenção de motéis
      final moteis = [
        Motel(fantasia: 'Motel 1', bairro: 'Descrição 1'),
        Motel(fantasia: 'Motel 2', bairro: 'Descrição 2'),
      ];
      mockController.listAll.value = ResultState<List<Motel>>.ok(moteis,true,false,moteis,'');
    });

    // Construção do widget com o mock
    await tester.pumpWidget(
      MaterialApp(
        home: GoNowView(),
      ),
    );

    // Verificação do estado de carregamento
    expect(find.byType(Shimmer), findsWidgets);

    // Simula a conclusão do carregamento
    await tester.pumpAndSettle();

    // Verificação dos motéis exibidos
    expect(find.text('Motel 1'), findsOneWidget);
    expect(find.text('Motel 2'), findsOneWidget);
  });
}
