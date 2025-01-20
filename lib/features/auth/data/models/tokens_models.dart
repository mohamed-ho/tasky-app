import 'package:tasky/features/auth/domain/entities/tokens.dart';

class TokensModels extends Tokens {
  TokensModels({
    required super.refreshToken,
    required super.accessToken,
  });
  factory TokensModels.formJson(Map<String, dynamic> json) {
    return TokensModels(
      refreshToken: json['refresh_token'],
      accessToken: json['access_token'],
    );
  }

  factory TokensModels.formToken(Tokens token) {
    return TokensModels(
      refreshToken: token.refreshToken,
      accessToken: token.accessToken,
    );
  }
}
