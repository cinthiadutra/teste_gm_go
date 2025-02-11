import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:test_gm_go/home/data/datasources/home_datasource.dart';
import 'package:test_gm_go/home/data/service/client_http.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';

import '../home/data/repository/home_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerFactory<ClientHttp>(() => ClientHttpImp());

  getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl());

  getIt.registerSingleton<HomeDatasource>(
      HomeDatasourceImp(client: getIt.call()));
  getIt.registerLazySingleton(() => HomeController(repository: getIt.call()));
  getIt.registerFactory(http.Client.new);
}
