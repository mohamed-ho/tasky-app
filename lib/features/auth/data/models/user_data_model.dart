import 'package:tasky/features/auth/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  UserDataModel(
      {required super.address,
      required super.displayName,
      required super.experienceYears,
      required super.level,
      required super.password,
      required super.phone});
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        address: json['address'],
        displayName: json['displayName'],
        experienceYears: json["experienceYears"],
        level: json['level'],
        password: json['password'],
        phone: json['username']);
  }

  factory UserDataModel.fromUserData(UserData user) {
    return UserDataModel(
        address: user.address,
        displayName: user.displayName,
        experienceYears: user.experienceYears,
        level: user.level,
        password: user.password,
        phone: user.phone);
  }

  toJosn() {
    return {
      "phone": phone,
      "password": password,
      "displayName": displayName,
      "experienceYears": experienceYears.toString(),
      "address": address,
      "level": level
    };
  }
}
