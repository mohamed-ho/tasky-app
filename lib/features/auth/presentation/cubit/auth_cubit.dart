import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/auth/domain/usecases/get_profile_usecse.dart';
import 'package:tasky/features/auth/domain/usecases/login_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/regitster_usercase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetProfileUsecse getProfileUsecse;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final RefreshTokenUsecase refreshTokenUsecase;
  final RegitsterUsercase regitsterUsercase;
  AuthCubit(
      {required this.getProfileUsecse,
      required this.loginUsecase,
      required this.logoutUsecase,
      required this.refreshTokenUsecase,
      required this.regitsterUsercase})
      : super(AuthInitial());

  Future<void> getProfileData() async {
    emit(AuthLoadingState());
    final result = await getProfileUsecse();
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthGetedProfileDataSTate(userData: r)));
  }

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final result = await loginUsecase(phone, password);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> logout() async {
    emit(AuthLoadingState());
    final result = await logoutUsecase();
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> refreshToken() async {
    emit(AuthLoadingState());
    final result = await refreshTokenUsecase();
    result.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthLoadedState()),
    );
  }

  Future<void> register({required UserData user}) async {
    emit(AuthLoadingState());
    final result = await regitsterUsercase(user);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }
}
