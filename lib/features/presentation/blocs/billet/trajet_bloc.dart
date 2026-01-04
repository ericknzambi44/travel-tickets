import 'package:dream_tickets/features/domain/usecases/billet_usecases/get_trajet.dart';
import 'package:dream_tickets/features/presentation/blocs/billet/trajet_event.dart';
import 'package:dream_tickets/features/presentation/blocs/billet/trajet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrajetBloc extends Bloc<TrajetEvent, Trajetstate> {
  final GetTrajets getTrajets;
  TrajetBloc({required this.getTrajets}) : super(TrajeteInitial()) {
    on<getTrajet>((event, emit) async {
      emit(TrajetLoading());
      final result = await getTrajets.call(
        depart: event.depart,
        arriver: event.arriver,
      );
      result.fold(
        (failure) => emit(TrajeFailure(message: failure.toString())),
        (trajet) => emit(TrajetLoaded(trajet: trajet)),
      );
    });
  }
}
