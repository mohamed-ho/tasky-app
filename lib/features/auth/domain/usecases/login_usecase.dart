import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';

import 'package:tasky/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});
  Future<Either<Failure, void>> call(String phone, String password) async {
    return authRepository.login(phone, password);
  }
}
