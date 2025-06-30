
class UserSingleton {
  static UserSingleton? _instance;
  String? uid;

  UserSingleton._internal();

  static UserSingleton get instance {
    _instance ??= UserSingleton._internal();
    return _instance!;
  }
}
