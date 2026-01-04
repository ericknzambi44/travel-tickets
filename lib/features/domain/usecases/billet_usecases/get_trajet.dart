import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:dream_tickets/features/domain/repositories/billet_Trajet_repository.dart';

class GetTrajets {
  final BilletRepository repository;

  GetTrajets(this.repository);

  Future<Either<Failure, TrajetEntity>> call({
    required String depart,
    required String arriver,
  }) async {
    return await repository.getTrajetdetail(depart: depart, arriver: arriver);
  }
}
