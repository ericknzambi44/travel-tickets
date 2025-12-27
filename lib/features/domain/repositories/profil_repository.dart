import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/profil.dart';

abstract class ProfilRepository {
  Future<Either<Failure, ProfilEntity>> getProfil();

  Future<Either<Failure, ProfilEntity>> updateProfil({
    required String nom,
    required String adresse,
    required String email,
  });

  Future<Either<Failure, void>> deleteProfil();
}
