import 'package:flutter_riverpod/legacy.dart';
import 'package:grew/core/utils/auth/auth_status.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthInitial()) {}
}
