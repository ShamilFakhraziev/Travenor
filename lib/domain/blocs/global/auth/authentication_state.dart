abstract class AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

//TODO: Major. Каждый state отдельное состояние экрана. Состояние логаут - нет
class AuthenticationLogout extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String errorMessage;

  AuthenticationFailure({required this.errorMessage});
}
