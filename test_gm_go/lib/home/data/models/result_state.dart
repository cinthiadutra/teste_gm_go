import 'package:test_gm_go/home/data/models/motel.dart';

class ResultState<T> {
  final bool running;
  final bool error;
  final T? result;
  final String message;

  ResultState({this.running = false, this.error = false, this.result, this.message =''});

  ResultState.ok(List<Motel> moteis, this.running, this.error, this.result, this.message);
}