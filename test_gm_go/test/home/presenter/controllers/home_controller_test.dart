import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/data/models/suite.dart';
import 'package:test_gm_go/home/data/repository/home_repository.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockHomeRepository;
  late HomeController homeController;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    homeController = HomeController(repository: mockHomeRepository);
  });

  test('Deve atualizar listAll e listMoteis com os dados simulados', () async {
    // Dados simulados
    final suite = Suite(); // Preencha com os dados desejados
    final motel = Motel(
      fantasia: 'Motel Exemplo',
      logo: 'logo.png',
      bairro: 'Centro',
      distancia: 1.5,
      qtdFavoritos: 10,
      suites: [suite],
      qtdAvaliacoes: 5,
      media: 4.2,
    );

    // Configurar o mock para retornar os dados simulados
    when(mockHomeRepository.getMotels()).thenAnswer(
      (_) async => Right([motel]),
    );

    // Chamar o método
    await homeController.getMotels();

    // Verificar se listAll foi atualizado corretamente
    expect(homeController.listAll.value.result, isNotEmpty);
    expect(homeController.listAll.value.result?.first.fantasia, 'Motel Exemplo');

    // Verificar se listMoteis foi atualizado corretamente
    expect(homeController.listMoteis.value, isNotEmpty);
    expect(homeController.listMoteis.value.first.fantasia, 'Motel Exemplo');
  });
}
