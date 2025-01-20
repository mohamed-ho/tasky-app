import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/features/auth/auth_enjection.dart';
import 'package:tasky/features/home/home_enjection.dart';

final ls = GetIt.instance;

class TaskyEnjection {
  init() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    ls.registerLazySingleton(() => shared);
    AuthEnjection().init();
    HomeEnjection().init();
  }
}
