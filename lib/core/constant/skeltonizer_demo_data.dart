import 'package:tasky/features/auth/domain/entities/user_data.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';

class SkeltonizerDemoData {
  static Todo doto = Todo(
      image: 'assets/images/todo.png',
      title: 'title title title title title title title ',
      updatedAt: '2024-12-28T19:43:39.519Z',
      desc:
          "desc desc desc desc desc desc desc desc desc desc desc desc desc desc desc des ",
      priority: "medium",
      status: "finished",
      createdAt: '2024-12-28T19:34:09.447Z');

  static UserData userData = UserData(
      address: 'address/address/address',
      displayName: 'displayName displayName displ',
      experienceYears: 4,
      level: "level",
      password: "password",
      phone: "phonephone");
}
