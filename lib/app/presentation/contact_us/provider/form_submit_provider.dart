import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirelyticsinc/app/domain/usecase/submit_form_use_case.dart';

import '../../../../core/utils/resource/dependency_injection.dart';

final formSubmitProvider =
    StateNotifierProvider<FormSubmitNotifier, AsyncValue<String>>((ref) {
  return FormSubmitNotifier();
});

class FormSubmitNotifier extends StateNotifier<AsyncValue<String>> {
  FormSubmitNotifier() : super(const AsyncValue.data(''));

  Future<void> submitForm({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String message,
  }) async {
    state = const AsyncValue.loading();
    final param = SubmitFormParams(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        message: message);

    final result = await getIt<SubmitFormUseCase>().call(param);

    result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (r) => state = AsyncValue.data(r ?? ''),
    );
  }
}
