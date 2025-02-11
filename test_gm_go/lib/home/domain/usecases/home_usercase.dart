import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUsercase {
  final HomeRepository repository;

  HomeUsercase({required this.repository});

  Future<Either<Exception, List<Motel>>> execute() async {
    return await repository.getMotels();
  }
}