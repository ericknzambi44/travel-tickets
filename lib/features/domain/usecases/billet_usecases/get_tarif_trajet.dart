import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_trajet_repository.dart';

class GetTarifTrajet {
  final BilletRepository repository;

  GetTarifTrajet(this.repository);

  Future<Either<Failure, TrajetEntity>> call(String trajetId) async {
    return await repository.getTarifTrajet(trajetId);
  }
}
