import 'package:dream_tickets/features/domain/usecases/paiement_usecases/effectuerPaiement.dart';
import 'package:dream_tickets/features/presentation/blocs/paiement/paiement_event.dart';
import 'package:dream_tickets/features/presentation/blocs/paiement/paiement_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PaiementBloc extends Bloc<PaiementEvent, PaiementState> {
  final EffectuerPaiement effectuerPaiement;

  PaiementBloc({required this.effectuerPaiement}) : super(BilletInitial()) {
    on<EffectuerPaie>((event, emit) async {
      emit(PaiementLoading());
      final result = await effectuerPaiement.call(
        ticketId: event.ticketId,
        montant: event.montant,
        numeroTelephone: event.numeroTelephone,
        operateur: event.operateur,
      );
      result.fold(
        (failure) => emit(PaiementFailure(failure.message)),
        (paiement) => emit(PaiementLoaded(paiements: [paiement])),
      );
    });
  }
}
