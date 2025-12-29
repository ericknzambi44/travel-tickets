import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/users.dart';
import 'package:dream_tickets/features/domain/repositories/auth_repository.dart';

class GetcurrentUseCase {
  final AuthRepository repository;

  GetcurrentUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getCurrentUser();
  }
}
