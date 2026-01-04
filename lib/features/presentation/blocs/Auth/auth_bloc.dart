import 'package:dream_tickets/features/domain/usecases/auth_usecases/login.dart';
import 'package:dream_tickets/features/domain/usecases/auth_usecases/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());

      final result = await loginUseCase.call(
        email: event.email,
        password: event.password,
      );
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthSucces(user)),
      );
    });

    on<RegisterSubmitted>((event, emit) async {
      emit(AuthLoading());

      final result = await registerUseCase.call(
        email: event.email,
        password: event.password,
      );

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthSucces(user)),
      );
    });
  }
}
