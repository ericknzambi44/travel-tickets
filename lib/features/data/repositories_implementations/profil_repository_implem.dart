import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/data/datasources/profile_remote_datasource.dart';
import 'package:dream_tickets/features/domain/entities/profil.dart';
import 'package:dream_tickets/features/domain/repositories/profil_repository.dart';

class ProfilRepositoryImpl implements ProfilRepository {
  final ProfilRemoteDataSource remoteDataSource;

  ProfilRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> deleteProfil() {
    // TODO: implement deleteProfil
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfilEntity>> getProfil() async {
    try {
      final profil = await remoteDataSource.getProfil();
      return Right(profil);
    } catch (e) {
      return Left(
        ServerFailure(message: "Erreur Lors de la recuperation du profil"),
      );
    }
  }

  @override
  Future<Either<Failure, ProfilEntity>> updateProfil({
    required String nom,
    required String adresse,
    required String email,
  }) {
    // TODO: implement updateProfil
    throw UnimplementedError();
  }
}
