import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:dream_tickets/features/domain/entities/trajet.dart';
import 'package:equatable/equatable.dart';

abstract class BilletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BilletInitial extends BilletState {}

class BilletLoading extends BilletState {}

class BilletLoaded extends BilletState {
  final List<TicketEntity> billets;
  BilletLoaded({required this.billets});
  @override
  List<Object?> get props => [billets];
}

class BilletFailure extends BilletState {
  final String message;
  BilletFailure(this.message);
  @override
  List<Object?> get props => [message];
}
