import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/repositories/auth_repository.dart';

class Isuserloggedin {
  final AuthRepository repository;

  Isuserloggedin(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.isUserLoggedIn();
  }
}
