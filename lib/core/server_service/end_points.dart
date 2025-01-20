class EndPoints {
  static const String baseUrl = 'https://todo.iraqsapp.com/';
  static const String register = '${baseUrl}auth/register';
  static const String login = '${baseUrl}auth/login';
  static const String logout = '${baseUrl}auth/logout';
  static const String profile = '${baseUrl}auth/profile';
  static String refreshToken(String toke) =>
      '${baseUrl}auth/refresh-token?token=$toke';

  // todoURLs
  static const String todoUrl = '${baseUrl}todos';
  static const String getTodoList = '$todoUrl/?page=1';
  static String getOneTodo(String id) => '$todoUrl/$id';
  static const String addTodo = todoUrl;
  static String updateTodo(String id) => '$todoUrl/$id';
  static String deleteTodo(String id) => '$todoUrl/$id';
}
