import 'package:get_it/get_it.dart';
import 'package:tasky/core/server_service/http_service.dart';
import 'package:tasky/core/server_service/server_service.dart';
import 'package:tasky/features/auth/auth_enjection.dart';
import 'package:tasky/features/home/home_enjection.dart';

final ls = GetIt.instance;

class TaskyEnjection {
  init() async {
    ls.registerLazySingleton<ServerService>(() => HttpService());
    AuthEnjection().init();
    HomeEnjection().init();
  }
}
