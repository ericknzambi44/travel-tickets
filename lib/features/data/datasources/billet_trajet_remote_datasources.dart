import 'package:dream_tickets/features/data/models/billet.dart';
import 'package:dream_tickets/features/data/models/trajet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BilletRemoteDataSource {
  Future<List<TrajetModel>> getTrajets();
  Future<double> getTarifTrajet(int trajetId);
  Future<TicketModel> reserverTicket(
    int trajetId,
    String nomVoyageur,
    DateTime date,
  );
  Future<TicketModel> getTicket(int ticketId);
  Future<TrajetModel> getTrajeDetail(
    // int trajetId,
    String arriver,
    String depart,
  );
}

class BilletRemoteDataSourceImpl implements BilletRemoteDataSource {
  final SupabaseClient supabase;

  BilletRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<TrajetModel>> getTrajets() async {
    try {
      final response = await supabase.from('trajets').select();

      return (response as List)
          .map((json) => TrajetModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Erreur lors de la récupération des trajets : $e");
    }
  }

  @override
  Future<double> getTarifTrajet(int trajetId) async {
    // try {
    //  final response = await supabaseClient
    // .from('trajets')
    // .select('id',trajetId)
    // .eq('id', trajetId)
    //  .single();
    return 0;
    //  return (response['tarif'] as num).toDouble();
    // } catch (e) {
    //   throw Exception("Impossible de récupérer le tarif : $e");
    //  }
  }

  @override
  Future<TicketModel> getTicket(int ticketId) async {
    try {
      final response = await supabase
          .from('tickets')
          .select()
          .eq('id', ticketId)
          .single();

      return TicketModel.fromJson(response);
    } catch (e) {
      throw Exception("Ticket introuvable : $e");
    }
  }

  @override
  Future<TrajetModel> getTrajeDetail(String arriver, String depart) async {
    try {
      final response = await supabase
          .from('trajets')
          .select()
          .eq('depart', depart)
          .eq('arrivee', arriver)
          .single();
      return TrajetModel.fromJson(response);
    } catch (e) {
      throw Exception("Échec  : $e");
    }
  }

  @override
  Future<TicketModel> reserverTicket(
    int trajetId,
    String nomVoyageur,
    DateTime date,
  ) async {
    try {
      final response = await supabase
          .from('tickets')
          .insert({
            'trajet_id:': trajetId,
            'nom': nomVoyageur,
            'date': date.toIso8601String(),
            'profile': supabase.auth.currentUser!.id,
          })
          .select()
          .single();

      return TicketModel.fromJson(response);
    } catch (e) {
      throw Exception("Échec de l'achat du ticket : $e");
    }
  }
}
