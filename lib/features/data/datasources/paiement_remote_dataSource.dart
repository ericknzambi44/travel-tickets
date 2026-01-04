import 'package:dream_tickets/features/data/models/paiement.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PaiementRemoteDataSource {
  Future<PaiementModel> effectuerPaiement({
    required int ticketId,
    required double montant,
    required String numeroTelephone,
    required String operateur,
  });
}

class PaiementRemoteDataSourceImpl implements PaiementRemoteDataSource {
  final SupabaseClient supabaseClient;

  PaiementRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<PaiementModel> effectuerPaiement({
    required int ticketId,
    required double montant,
    required String numeroTelephone,
    required String operateur,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'ticket_id': ticketId,
        'montant': montant,
        //  'numero_telephone': numeroTelephone,
        //  'operateur': operateur,
      };

      final response = await supabaseClient
          .from('paiements')
          .insert(data)
          .select()
          .single();

      return PaiementModel.fromJson(response);
    } catch (e) {
      throw Exception(
        "Erreur lors de l'enregistrement du paiement pour le ticket $ticketId : $e",
      );
    }
  }
}
