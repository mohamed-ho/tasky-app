import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/auth/domain/repositories/auth_repository.dart';

class RegitsterUsercase {
  final AuthRepository authRepository;

  RegitsterUsercase({required this.authRepository});
  Future<Either<Failure, void>> call(UserData user) async {
    return authRepository.register(user);
  }
}
