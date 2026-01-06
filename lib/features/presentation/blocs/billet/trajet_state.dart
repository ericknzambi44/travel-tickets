// States
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:equatable/equatable.dart';

abstract class TrajetState extends Equatable {
  const TrajetState();

  @override
  List<Object> get props => [];
}

class TrajetInitial extends TrajetState {
  const TrajetInitial();
}

class TrajetLoading extends TrajetState {
  const TrajetLoading();
}

class TrajetLoaded extends TrajetState {
  final TrajetEntity trajet;

  const TrajetLoaded(this.trajet);

  @override
  List<Object> get props => [trajet];
}

class TrajetError extends TrajetState {
  final String message;

  const TrajetError(this.message);

  @override
  List<Object> get props => [message];
}
