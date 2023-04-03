import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_morty_bloc/data/datasources/characters_remote_data_source.dart';
import 'package:rick_morty_bloc/data/repositories/characters_repository_impl.dart';
import 'package:rick_morty_bloc/domain/repositories/characters_repository.dart';
import 'package:rick_morty_bloc/domain/usecases/get_characters_usecase.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - Characters, Eposides, ...
//Bloc
  sl.registerFactory(() => CharactersBloc(getCharctersUseCase: sl()));

//Usecases
  sl.registerLazySingleton(() => GetCharctersUseCase(sl()));

//Repository
  sl.registerLazySingleton<CharactersRepository>(() => CharactersRepositoryImpl(
      charactersRemoteDataSource: sl(), networkInfo: sl()));

//Datasources
  sl.registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSourceImpl(client: sl()));

//!core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

//!External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
