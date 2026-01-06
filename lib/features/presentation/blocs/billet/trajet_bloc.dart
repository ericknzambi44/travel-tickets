import 'package:dream_tickets/features/domain/usecases/billet_usecases/get_trajet.dart';
import 'package:dream_tickets/features/presentation/blocs/billet/trajet_event.dart';
import 'package:dream_tickets/features/presentation/blocs/billet/trajet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

// BLoC
class TrajetBloc extends Bloc<TrajetEvent, TrajetState> {
  final GetTrajets getTrajets;

  TrajetBloc({required this.getTrajets}) : super(const TrajetInitial()) {
    on<GetTrajetEvent>((event, emit) async {
      emit(const TrajetLoading());
      final result = await getTrajets(
        depart: event.depart,
        arriver: event.arriver,
      );
      result.fold(
        (failure) => emit(TrajetError(failure.toString())),
        (trajet) => emit(TrajetLoaded(trajet)),
      );
    });
  }
}
