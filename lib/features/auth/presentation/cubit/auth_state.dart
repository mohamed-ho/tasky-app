part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({required this.message});
}

class AuthLoadedState extends AuthState {}

class AuthGetedProfileDataSTate extends AuthState {
  final UserData userData;

  const AuthGetedProfileDataSTate({required this.userData});
}
