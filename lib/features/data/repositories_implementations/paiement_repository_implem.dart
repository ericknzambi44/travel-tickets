import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/data/datasources/paiement_remote_dataSource.dart';
import 'package:dream_tickets/features/domain/entities/paiement.dart';
import 'package:dream_tickets/features/domain/repositories/paiement_repository.dart';

class PaiementRepositoryImpl implements PaiementRepository {
  final PaiementRemoteDataSource remoteDataSource;

  PaiementRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> annulerPaiement(int paiementId) {
    // TODO: implement annulerPaiement
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PaiementEntity>> effectuerPaiement({
    required int ticketId,
    required double montant,
    required String numeroTelephone,
    required String operateur,
  }) async {
    try {
      final paiement = await remoteDataSource.effectuerPaiement(
        ticketId: ticketId,
        montant: montant,
        numeroTelephone: numeroTelephone,
        operateur: operateur,
      );
      return Right(paiement);
    } catch (e) {
      return Left(ServerFailure(message: "Erreur lors du paiement"));
    }
  }

  @override
  Future<Either<Failure, PaiementEntity>> verifierStatutPaiement(
    int paiementId,
  ) {
    // TODO: implement verifierStatutPaiement
    throw UnimplementedError();
  }
}
