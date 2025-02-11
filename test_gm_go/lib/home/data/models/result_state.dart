class ResultState<T> {
  final bool running;
  final bool error;
  final T? result;
  final String message;

  ResultState({this.running = false, this.error = false, this.result, this.message =''});
}