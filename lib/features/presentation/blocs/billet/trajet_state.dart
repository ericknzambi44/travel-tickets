import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:equatable/equatable.dart';

abstract class Trajetstate extends Equatable {
  const Trajetstate();
  @override
  List<Object?> get props => [];
}

class TrajeteInitial extends Trajetstate {}

class TrajetLoading extends Trajetstate {}

class TrajetLoaded extends Trajetstate {
  final TrajetEntity trajet;
  const TrajetLoaded({required this.trajet});
  @override
  List<Object?> get props => [trajet];
}

class TrajeFailure extends Trajetstate {
  final String message;
  const TrajeFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
