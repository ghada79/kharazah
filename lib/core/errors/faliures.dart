class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFaliure extends Failure {
  ServerFaliure({required super.errorMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}