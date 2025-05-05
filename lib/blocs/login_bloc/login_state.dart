abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String sessionId;

  AuthSuccessState(this.sessionId);
}

class AuthFailureState extends AuthState {
  final String error;

  AuthFailureState(this.error);
}
