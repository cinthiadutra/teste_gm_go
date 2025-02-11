import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_gm_go/home/data/models/api_response.dart';
import 'package:test_gm_go/home/data/service/client_http.dart';
import 'package:test_gm_go/home/data/utils/utils.dart';
import 'package:test_gm_go/home/data/datasources/home_datasource.dart';

// Criação do mock do ClientHttp
class MockClientHttp extends Mock implements ClientHttp {}

void main() {
  late MockClientHttp mockClient;
  late HomeDatasourceImp homeDatasource;

  setUp(() {
    // Inicializa o mock e a instância da HomeDatasourceImp
    mockClient = MockClientHttp();
    homeDatasource = HomeDatasourceImp(client: mockClient);
  });

  group('getMotels', () {
    test('deve retornar um ApiResponse com sucesso', () async {
      // Arrange: Configura o comportamento do mock
      final mockResponse = {'key': 'value'}; // Exemplo de resposta mockada
      when(mockClient.get(Utils.motelsUrl)).thenAnswer((_) async => mockResponse);

      // Act: Chama o método a ser testado
      final result = await homeDatasource.getMotels();

      // Assert: Verifica se o resultado é o esperado
      expect(result, isA<ApiResponse>());
      // Adicione mais verificações conforme necessário
    });

    test('deve retornar um ApiResponse vazio em caso de erro', () async {
      // Arrange: Configura o comportamento do mock para lançar uma exceção
      when(mockClient.get(Utils.motelsUrl)).thenThrow(Exception('Erro de rede'));

      // Act: Chama o método a ser testado
      final result = await homeDatasource.getMotels();

      // Assert: Verifica se o resultado é o esperado
      expect(result, isA<ApiResponse>());
      // Adicione mais verificações conforme necessário
    });
  });
}
