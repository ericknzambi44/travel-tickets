import 'package:equatable/equatable.dart';

abstract class TrajetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class getTrajet extends TrajetEvent {
  final String arriver;
  final String depart;
  getTrajet({required this.arriver, required this.depart});
  @override
  List<Object?> get props => [arriver, depart];
}
