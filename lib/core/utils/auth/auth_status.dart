sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {} // 앱 시작

class AuthLoading extends AuthState {} // 토큰 확인(로그인)

class Authenticated extends AuthState {} // 로그인 완료

class Unauthenticated extends AuthState {} // 로그아웃

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}
