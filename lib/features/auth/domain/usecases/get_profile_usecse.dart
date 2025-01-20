import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/auth/domain/repositories/auth_repository.dart';

class GetProfileUsecse {
  final AuthRepository authRepository;

  GetProfileUsecse({required this.authRepository});
  Future<Either<Failure, UserData>> call() async {
    return authRepository.getProfile();
  }
}
