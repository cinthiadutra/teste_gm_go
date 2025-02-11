import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:test_gm_go/home/data/datasources/home_datasource.dart';
import 'package:test_gm_go/home/data/models/api_response.dart';
import 'package:test_gm_go/home/data/models/data.dart';
import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/data/repository/home_repository.dart';
class MockHomeDatasource extends Mock implements HomeDatasource {}


void main() {
  late MockHomeDatasource mockHomeDatasource;
  late HomeRepositoryImpl homeRepository;

  setUp(() {
    mockHomeDatasource = MockHomeDatasource();
    homeRepository = HomeRepositoryImpl();
    homeRepository.datasource = mockHomeDatasource;
  });

  group('HomeRepositoryImpl', () {
    test('deve retornar uma lista de motéis quando a resposta for bem-sucedida', () async {
      // Arrange
      final mockMotels = [Motel(fantasia: 'Motel 1'), Motel(fantasia: 'Motel 2')];
      final mockApiResponse = ApiResponse(
        sucesso: true,
        data: Data(moteis: mockMotels),
        mensagem: [],
      );
      when(mockHomeDatasource.getMotels()).thenAnswer((_) async => mockApiResponse);

      // Act
      final result = await homeRepository.getMotels();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Esperava-se uma lista de motéis, mas ocorreu um erro'),
        (r) => expect(r, mockMotels),
      );
    });

    test('deve retornar uma exceção quando ocorrer um erro', () async {
      // Arrange
      final mockException = Exception('Erro ao buscar motéis');
      when(mockHomeDatasource.getMotels()).thenThrow(mockException);

      // Act
      final result = await homeRepository.getMotels();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, mockException),
        (r) => fail('Esperava-se uma exceção, mas obteve-se uma lista de motéis'),
      );
    });
  });
}
