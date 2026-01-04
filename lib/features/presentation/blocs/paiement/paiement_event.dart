import 'package:equatable/equatable.dart';

abstract class PaiementEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EffectuerPaie extends PaiementEvent {
  final int ticketId;
  final double montant;
  final String numeroTelephone;
  final String operateur;
  EffectuerPaie({
    required this.ticketId,
    required this.montant,
    required this.numeroTelephone,
    required this.operateur,
  });
  @override
  List<Object?> get props => [montant, numeroTelephone, operateur];
}
