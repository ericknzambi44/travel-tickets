import 'package:dream_tickets/features/data/datasources/billet_trajet_remote_datasources.dart';
import 'package:dream_tickets/features/data/datasources/user_remote_datasources.dart';
import 'package:dream_tickets/features/data/repositories_implementations/Auth_repository_implem.dart';
import 'package:dream_tickets/features/data/repositories_implementations/billet_trajet_repository_impl.dart';
import 'package:dream_tickets/features/domain/repositories/auth_repository.dart';
import 'package:dream_tickets/features/domain/repositories/billet_Trajet_repository.dart';
import 'package:dream_tickets/features/domain/usecases/auth_usecases/getcurrent.dart';
//import 'package:dream_tickets/features/domain/usecases/auth_usecases/getcurrent.dart';
import 'package:dream_tickets/features/domain/usecases/auth_usecases/isUserLoggedIN.dart';
import 'package:dream_tickets/features/domain/usecases/auth_usecases/login.dart';
import 'package:dream_tickets/features/domain/usecases/auth_usecases/logout.dart';
import 'package:dream_tickets/features/domain/usecases/auth_usecases/register.dart';
import 'package:dream_tickets/features/domain/usecases/billet_usecases/get_ticket.dart';
import 'package:dream_tickets/features/domain/usecases/billet_usecases/get_trajet.dart';
import 'package:dream_tickets/features/domain/usecases/billet_usecases/reserverTicket.dart';
import 'package:dream_tickets/features/presentation/blocs/Auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //pour AuthUser
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl()),
  );

  sl.registerFactory<AuthRepository>(
    () => UserRepositoryImpl(sl<SupabaseClient>(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(sl<AuthRepository>()),
  );
  //  sl.registerLazySingleton(() => GetcurrentUseCase(sl()));
  sl.registerLazySingleton<GetcurrentUseCase>(
    () => GetcurrentUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<Isuserloggedin>(
    () => Isuserloggedin(sl<AuthRepository>()),
  );
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
    ),
  );

  //pour billet et Trajet

  sl.registerLazySingleton<BilletRemoteDataSource>(
    () => BilletRemoteDataSourceImpl(sl()),
  );
  sl.registerFactory<BilletRemoteDataSource>(
    () => BilletRemoteDataSourceImpl(sl()),
  );

  sl.registerFactory<BilletRepository>(() => BilletTrajetRepositoryImpl(sl()));

  sl.registerLazySingleton<GetTrajets>(
    () => GetTrajets(sl<BilletRepository>()),
  );
  sl.registerLazySingleton<GetTickets>(
    () => GetTickets(sl<BilletRepository>()),
  );
  sl.registerLazySingleton<ReserverTicket>(
    () => ReserverTicket(sl<BilletRepository>()),
  );
}
