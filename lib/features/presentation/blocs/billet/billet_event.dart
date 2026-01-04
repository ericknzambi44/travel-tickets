import 'package:equatable/equatable.dart';

abstract class BilletEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class getBillets extends BilletEvent {
  final int ticketid;
  getBillets({required this.ticketid});
}

class acheterBilletSubmitted extends BilletEvent {
  final int trajetId;
  final double prix;
  acheterBilletSubmitted({required this.trajetId, required this.prix});

  @override
  List<Object?> get props => [trajetId, prix];
}
