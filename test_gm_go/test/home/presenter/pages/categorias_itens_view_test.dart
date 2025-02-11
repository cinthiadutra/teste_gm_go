import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:test_gm_go/home/data/models/item_categoria.dart';
import 'package:test_gm_go/home/data/models/suite.dart';
import 'package:test_gm_go/home/presenter/pages/categorias_itens_view.dart';

class MockSuite extends Mock implements Suite {}

void main() {
  testWidgets('CategoriasItensView exibe os itens corretamente', (tester) async {
    // Criação do mock da entidade Suite
    final mockSuite = MockSuite();

    // Configuração do comportamento do mock
    when(() => mockSuite.nome).thenReturn('Suíte Luxo');
    when(() => mockSuite.categoriaItens).thenReturn([
      CategoriaItem(nome: 'Ar Condicionado', icone: 'url_do_icone'),
      CategoriaItem(nome: 'Wi-Fi', icone: 'url_do_icone'),
      // Adicione mais itens conforme necessário
    ]);

    // Construção do widget com o mock
    await tester.pumpWidget(
      MaterialApp(
        home: CategoriasItensView(entity: mockSuite),
      ),
    );

    // Verificação se o nome da suíte está sendo exibido
    expect(find.text('suíte luxo'), findsOneWidget);

    // Verificação se os itens principais estão sendo exibidos
    expect(find.text('princípais itens'), findsOneWidget);
    expect(find.text('tem também'), findsOneWidget);

    // Verificação se os itens da categoria estão sendo exibidos
    for (var item in mockSuite.categoriaItens!) {
      expect(find.text(item.nome!.toLowerCase()), findsOneWidget);
    }
  });
}
