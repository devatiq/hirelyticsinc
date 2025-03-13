sealed class Failure {
  final String message;

  const Failure([this.message = '']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server Failure']);
}

class ApiFailure extends Failure {
  const ApiFailure([super.message = 'Api Failure']);
}

class HiveFailure extends Failure {
  const HiveFailure([super.message = 'Hive Database Failure']);
}

class DriftFailure extends Failure {
  const DriftFailure([super.message = 'Drift Database Failure']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache Failure']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unknown Failure']);
}

class CustomFailure extends Failure {
  const CustomFailure([super.message = 'Unknown Failure']);
}
