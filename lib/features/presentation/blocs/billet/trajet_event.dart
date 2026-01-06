import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

// Events
abstract class TrajetEvent extends Equatable {
  const TrajetEvent();

  @override
  List<Object> get props => [];
}

class GetTrajetEvent extends TrajetEvent {
  final String depart;
  final String arriver;

  const GetTrajetEvent({required this.depart, required this.arriver});

  @override
  List<Object> get props => [depart, arriver];
}
