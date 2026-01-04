import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/entities/paiement.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:equatable/equatable.dart';

abstract class PaiementState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BilletInitial extends PaiementState {}

class PaiementLoading extends PaiementState {}

class PaiementLoaded extends PaiementState {
  final List<PaiementEntity> paiements;
  PaiementLoaded({required this.paiements});
  @override
  List<Object?> get props => [paiements];
}

class PaiementFailure extends PaiementState {
  final String message;
  PaiementFailure(this.message);
  @override
  List<Object?> get props => [message];
}
