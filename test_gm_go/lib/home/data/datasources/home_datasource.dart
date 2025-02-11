

import 'package:test_gm_go/home/data/models/api_response.dart';
import 'package:test_gm_go/home/data/service/client_http.dart';
import 'package:test_gm_go/home/data/utils/utils.dart';

abstract class HomeDatasource {
  Future<ApiResponse> getMotels();
 
}


class HomeDatasourceImp extends HomeDatasource {
  final ClientHttp _client;

  HomeDatasourceImp({required ClientHttp client}) : _client = client;

  @override
  Future<ApiResponse> getMotels() async {
    try{
    final response = await _client.get(Utils.motelsUrl);
    return ApiResponse.fromJson(response);
    }catch(e){
      return ApiResponse.empty();
    }
  }
}