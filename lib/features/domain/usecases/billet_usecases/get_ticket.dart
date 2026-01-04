import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_Trajet_repository.dart';

class GetTickets {
  final BilletRepository repository;

  GetTickets(this.repository);

  Future<Either<Failure, TicketEntity>> call({required int ticketId}) async {
    return await repository.getTicket(ticketId);
  }
}
