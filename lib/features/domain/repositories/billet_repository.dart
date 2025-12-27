import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';

abstract class BilletRepository {
  Future<Either<Failure, List<TrajetEntity>>> getTrajets();

  Future<Either<Failure, double>> getTarifTrajet(String trajetId);

  Future<Either<Failure, TicketEntity>> acheterTicket({
    required String trajetId,
    required String nomVoyageur,
    required String prenomVoyageur,
    required double montant,
  });

  Future<Either<Failure, TicketEntity>> getTicket(String ticketId);
}
