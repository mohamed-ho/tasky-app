import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register(UserData user);
  Future<Either<Failure, void>> login(String phone, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> refreshToken();
  Future<Either<Failure, UserData>> getProfile();
}
