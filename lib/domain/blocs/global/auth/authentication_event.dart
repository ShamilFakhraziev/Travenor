abstract class AuthenticationEvent {}

class LoginRequested extends AuthenticationEvent {
  final String username;
  final String password;

  LoginRequested({required this.username, required this.password});
}

class LogoutRequested extends AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {}
