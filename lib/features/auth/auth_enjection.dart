import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasky/core/server_service/http_service.dart';
import 'package:tasky/core/server_service/server_service.dart';
import 'package:tasky/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:tasky/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tasky/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tasky/features/auth/domain/repositories/auth_repository.dart';
import 'package:tasky/features/auth/domain/usecases/get_profile_usecse.dart';
import 'package:tasky/features/auth/domain/usecases/login_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/regitster_usercase.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/tasky_enjection.dart';

class AuthEnjection {
  init() {
    ls.registerFactory(() => AuthCubit(
        getProfileUsecse: ls(),
        loginUsecase: ls(),
        logoutUsecase: ls(),
        refreshTokenUsecase: ls(),
        regitsterUsercase: ls()));

    ls.registerLazySingleton(() => GetProfileUsecse(authRepository: ls()));
    ls.registerLazySingleton(() => LoginUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => LogoutUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => RefreshTokenUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => RegitsterUsercase(authRepository: ls()));

    ls.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteDataSource: ls()));

    ls.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(serverService: ls()));
    ls.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(secureStorage: ls()));
    ls.registerLazySingleton(() => const FlutterSecureStorage());
    ls.registerLazySingleton<ServerService>(() => HttpService());
  }
}
