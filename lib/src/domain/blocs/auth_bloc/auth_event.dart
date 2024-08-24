abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginEvent({required this.phoneNumber, required this.password});
}
