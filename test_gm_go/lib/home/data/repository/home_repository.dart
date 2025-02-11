import 'package:dartz/dartz.dart';
import 'package:test_gm_go/home/data/datasources/home_datasource.dart';
import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/presenter/pages/home_view.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<Motel>>> getMotels();
}

class HomeRepositoryImpl extends HomeRepository {
  HomeDatasource datasource = HomeDatasourceImp(client: getIt.call());
  @override
  Future<Either<Exception, List<Motel>>> getMotels() async {
    try {
      final resp = await datasource.getMotels();

      final listMoteis = resp.data?.moteis ?? [];
      return Right(listMoteis);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
