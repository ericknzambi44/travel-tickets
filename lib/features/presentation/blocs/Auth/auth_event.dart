import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class RegisterSubmitted extends AuthEvent {
  final String email;
  final String password;
  RegisterSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  LoginSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
