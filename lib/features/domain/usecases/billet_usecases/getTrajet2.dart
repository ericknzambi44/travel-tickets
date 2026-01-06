import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_Trajet_repository.dart';

class GetTrajetss {
  final BilletRepository repository;

  GetTrajetss(this.repository);

  Future<Either<Failure, List<TrajetEntity>>> call() async {
    return await repository.getTrajets();
  }
}
