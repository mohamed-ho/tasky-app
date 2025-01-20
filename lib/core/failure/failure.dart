abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  String getMessage() => message;
}

class CachFailure extends Failure {
  CachFailure({required super.message});
  String getMessage() => message;
}
