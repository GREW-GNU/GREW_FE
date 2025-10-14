import 'package:grew/domain/entities/user.dart';

class AuthService {
  Future<User?> getCurrentUser() async {
    // 사용자 정보 로드
    return null;
  }

  Future<User> login(String accessToken, String refreshToken) async {
    return User(id: 1, email: "wldnjstj99@gmail.com", nickname: "서지원");
  }

  void logout() {}
}
