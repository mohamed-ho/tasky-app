import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';

import 'package:tasky/features/auth/domain/repositories/auth_repository.dart';

class RefreshTokenUsecase {
  final AuthRepository authRepository;

  RefreshTokenUsecase({required this.authRepository});
  Future<Either<Failure, void>> call() async {
    return authRepository.refreshToken();
  }
}
