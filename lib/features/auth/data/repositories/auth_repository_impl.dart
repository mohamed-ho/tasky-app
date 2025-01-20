import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tasky/features/auth/data/models/user_data_model.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserData>> getProfile() async {
    try {
      final result = await authRemoteDataSource.getProfile();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> login(String phone, String password) async {
    try {
      final result = await authRemoteDataSource.login(phone, password);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await authRemoteDataSource.logout();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> refreshToken() async {
    try {
      final result = await authRemoteDataSource.refreshToken();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> register(UserData user) async {
    try {
      final result =
          await authRemoteDataSource.register(UserDataModel.fromUserData(user));
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
