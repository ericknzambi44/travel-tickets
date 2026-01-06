import 'package:dream_tickets/features/presentation/blocs/billet/billet_bloc.dart';
import 'package:dream_tickets/features/presentation/blocs/billet/trajet_bloc.dart';
import 'package:dream_tickets/features/presentation/pages/EnregistrerPage.dart';
import 'package:dream_tickets/features/presentation/pages/Paiement.dart';
import 'package:dream_tickets/features/presentation/pages/connexionPage.dart';
import 'package:dream_tickets/features/presentation/pages/paiementPaiement.dart';
import 'package:dream_tickets/features/presentation/pages/profile.dart';
import 'package:dream_tickets/features/presentation/pages/profileProfile.dart';
import 'package:dream_tickets/features/presentation/pages/reservation.dart';
import 'package:dream_tickets/features/presentation/pages/ticket.dart';
import 'package:dream_tickets/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<TrajetBloc>()),
        BlocProvider<BilletBloc>(create: (context) => di.sl<BilletBloc>()),
      ],
      child: MaterialApp(
        title: 'dream_tickets',
        routes: <String, WidgetBuilder>{
          '/connex': (BuildContext context) => ConnexionPage(),
          '/e': (BuildContext context) => EnregistrerPage(),
          '/': (BuildContext context) => ReservationPage(),
          'profile': (BuildContext context) => ProfilePage2(),
          '/paiement': (BuildContext context) => PaiemenPage(),

          // '/ticket': (BuildContext context) => TicketPage(),
        },
      ),
    ),
  );
}
