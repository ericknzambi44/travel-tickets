import 'package:dream_tickets/features/presentation/pages/EnregistrerPage.dart';
import 'package:dream_tickets/features/presentation/pages/Paiement.dart';
import 'package:dream_tickets/features/presentation/pages/connexionPage.dart';
import 'package:dream_tickets/features/presentation/pages/profile.dart';
import 'package:dream_tickets/features/presentation/pages/reservation.dart';
import 'package:dream_tickets/features/presentation/pages/ticket.dart';
import 'package:dream_tickets/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.get("SUPABASE_URL"),
    anonKey: dotenv.get("SUPABASE_KEY"),
  );
  await di.init();
  runApp(
    MaterialApp(
      title: 'dream_tickets',
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => ConnexionPage(),
        '/': (BuildContext context) => EnregistrerPage(),
        // '/': (BuildContext context) => ReservationPage(),
        // '/': (BuildContext context) => ProfilePage(),
        // '/': (BuildContext context) => PaiemenPage(),
        // '/ticket': (BuildContext context) => TicketPage(),
      },
    ),
  );
}
