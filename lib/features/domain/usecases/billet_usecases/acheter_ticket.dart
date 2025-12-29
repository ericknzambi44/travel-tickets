import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_trajet_repository.dart';

class AcheterTicket {
  final BilletRepository repository;

  AcheterTicket(this.repository);

  Future<Either<Failure, TicketEntity>> call({
    required String trajetId,
    required String nomVoyageur,
    required String prenomVoyageur,
    required double montant,
  }) async {
    return await repository.acheterTicket(
      trajetId: trajetId,
      nomVoyageur: nomVoyageur,
      montant: montant,
    );
  }
}
