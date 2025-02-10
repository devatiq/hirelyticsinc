import 'package:fpdart/fpdart.dart';
import 'package:hirelyticsinc/app/domain/repository/repository.dart';
import 'package:hirelyticsinc/core/error/data_state.dart';
import 'package:hirelyticsinc/core/usecase/usecase.dart';

import '../../data/model/submit_form_remote_post_model.dart';

class SubmitFormUseCase implements UseCase<String?, SubmitFormParams> {
  final Repository repository;

  const SubmitFormUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(SubmitFormParams params) async {
    final result = await repository.submitForm(SubmitFormRemotePostModel(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      phone: params.phone,
      message: params.message,
    ));
    return result.fold((l) => Left(l), (r) => Right(r.confirmationMessage));
  }
}

class SubmitFormParams {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String message;

  const SubmitFormParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.message,
  });
}
