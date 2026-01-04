import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';

abstract class BilletRepository {
  Future<Either<Failure, List<TrajetEntity>>> getTrajets();

  Future<Either<Failure, double>> getTarifTrajet(int trajetId);

  Future<Either<Failure, TicketEntity>> reserver({
    required int trajetId,
    required String nomVoyageur,
    required DateTime date,
  });

  Future<Either<Failure, TicketEntity>> getTicket(int ticketId);

  Future<Either<Failure, TrajetEntity>> getTrajetdetail({
    required String depart,
    required String arriver,
  });
}
