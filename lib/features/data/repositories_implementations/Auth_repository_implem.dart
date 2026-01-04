import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/data/datasources/user_remote_datasources.dart';
import 'package:dream_tickets/features/data/models/User.dart';
import 'package:dream_tickets/features/domain/entities/users.dart';
import 'package:dream_tickets/features/domain/repositories/auth_repository.dart';

class UserRepositoryImpl implements AuthRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl(Object object, {required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right<Failure, UserEntity>(user as UserEntity);
    } catch (e) {
      return Left(
        ServerFailure(
          message: "Erreur Lors de la recuperation de l'utilisateur ",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isUserLoggedIn() async {
    try {
      final resultat = remoteDataSource.isUserLoggedIn();
      return Right(resultat);
    } catch (e) {
      return Left(
        ServerFailure(
          message: "Erreur lors de la verification de l'etat de connection",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure(message: "Erreur lors de la connexion"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "Erreur lors de la deconnection"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.register(email, password);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure(message: " Erreur Lors de L'inscription"));
    }
  }
}
