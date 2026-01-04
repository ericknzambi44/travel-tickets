import 'package:dream_tickets/features/domain/usecases/billet_usecases/get_ticket.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'billet_event.dart';
import 'billet_state.dart';

class BilletBloc extends Bloc<BilletEvent, BilletState> {
  final GetTickets getBilletsUseCase;

  BilletBloc({required this.getBilletsUseCase}) : super(BilletInitial()) {
    on<getBillets>((event, emit) async {
      emit(BilletLoading());
      final result = await getBilletsUseCase.call(ticketId: event.ticketid);
      result.fold(
        (failure) => emit(BilletFailure(failure.message)),
        (billet) => emit(BilletLoaded(billets: [billet])),
      );
    });
  }
}
