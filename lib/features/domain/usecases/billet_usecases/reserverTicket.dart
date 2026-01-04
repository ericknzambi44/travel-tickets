import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_Trajet_repository.dart';

class ReserverTicket {
  final BilletRepository repository;

  ReserverTicket(this.repository);

  Future<Either<Failure, TicketEntity>> call({
    required int trajetId,
    required String nomPassager,
    required DateTime date,
  }) async {
    return await repository.reserver(
      trajetId: trajetId,
      nomVoyageur: nomPassager,
      date: date,
    );
  }
}
