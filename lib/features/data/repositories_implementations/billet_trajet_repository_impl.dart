import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/data/datasources/billet_trajet_remote_datasources.dart';
import 'package:dream_tickets/features/data/models/billet.dart';
import 'package:dream_tickets/features/data/models/trajet.dart';
import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_Trajet_repository.dart';

class BilletTrajetRepositoryImpl implements BilletRepository {
  final BilletRemoteDataSource remoteDataSource;

  BilletTrajetRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, double>> getTarifTrajet(int trajetId) async {
    try {
      final tarif = await remoteDataSource.getTarifTrajet(trajetId);
      return Right(tarif);
    } catch (e) {
      return Left(
        ServerFailure(message: "Impossible de recuperer le tarif du trajet"),
      );
    }
  }

  @override
  Future<Either<Failure, TicketEntity>> getTicket(int ticketId) async {
    try {
      final ticket = await remoteDataSource.getTicket(ticketId);
      return Right(ticket);
    } catch (e) {
      return Left(ServerFailure(message: "Impossible de recuperer le ticket"));
    }
  }

  @override
  Future<Either<Failure, List<TrajetEntity>>> getTrajets() async {
    try {
      final trajets = await remoteDataSource.getTrajets();
      return Right(trajets);
    } catch (e) {
      return Left(ServerFailure(message: "Imposibles de recuperer les trajet"));
    }
  }

  @override
  Future<Either<Failure, TrajetEntity>> getTrajetdetail({
    required String depart,
    required String arriver,
  }) async {
    try {
      final TrajetModel = await remoteDataSource.getTrajeDetail(
        arriver,
        depart,
      );
      return Right(TrajetModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: "Ce trajet n'existe pas"));
    }
  }

  @override
  Future<Either<Failure, TicketEntity>> reserver({
    required int trajetId,
    required String nomVoyageur,
    required DateTime date,
  }) async {
    try {
      final TicketModel = await remoteDataSource.reserverTicket(
        trajetId,
        nomVoyageur,
        date,
      );
      return Right(TicketModel.toEntity());
    } catch (e) {
      return left(ServerFailure(message: "Erreur lors de reservATION"));
    }
  }
}
