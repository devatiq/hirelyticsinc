sealed class Failure {
  String message;

  Failure([this.message = '']);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Server Failure']);
}

class ApiFailure extends Failure {
  ApiFailure([super.message = 'Api Failure']);
}

class HiveFailure extends Failure{
  HiveFailure([super.message = 'Hive Database Failure']);
}

class DriftFailure extends Failure{
  DriftFailure([super.message = 'Drift Database Failure']);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = 'Cache Failure']);
}
class UnknownFailure extends Failure {
  UnknownFailure([super.message = 'Unknown Failure']);
}

class CustomFailure extends Failure {
  CustomFailure([super.message = 'Unknown Failure']);
}