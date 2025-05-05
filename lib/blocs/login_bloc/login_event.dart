abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent(this.username, this.password);
}

class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String confirmPassword;

  AuthRegisterEvent(this.username, this.password, this.confirmPassword);

}
