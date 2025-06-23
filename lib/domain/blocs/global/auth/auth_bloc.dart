import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/domain/blocs/global/auth/authentication_event.dart';
import 'package:travel_app/domain/blocs/global/auth/authentication_state.dart';
import 'package:travel_app/domain/services/auth_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;
  AuthenticationBloc(this._authenticationService)
    : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAuthenticationStarted(
    AuthenticationStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationInitial());
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationService.login(event.username, event.password);
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationService.logout();
      emit(AuthenticationLogout());
    } catch (e) {
      emit(AuthenticationFailure(errorMessage: e.toString()));
    }
  }
}
