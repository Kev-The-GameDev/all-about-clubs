import 'package:aac/1_application/clubBloc/club_bloc.dart';
import 'package:aac/2_domain/repositories/club_repository.dart';
import 'package:aac/2_domain/useCases/club_useCases.dart';
import 'package:aac/3_infrastructure/datasources/club_remote_datasource.dart';
import 'package:aac/3_infrastructure/repositories/club_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // Application layer
  serviceLocator.registerFactory(() => ClubBloc(usecases: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(
      () => ClubUsecases(clubRepository: serviceLocator()));

  // Repo
  serviceLocator.registerLazySingleton<ClubRepository>(
      () => ClubRepositoryImpl(remoteDataSource: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<ClubRemoteDataSource>(
      () => ClubRemoteDataSourceImpl(client: serviceLocator()));

  // extern
  serviceLocator.registerLazySingleton(() => http.Client());

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
