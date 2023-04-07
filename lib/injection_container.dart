import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_morty_bloc/data/datasources/characters_remote_data_source.dart';
import 'package:rick_morty_bloc/data/datasources/eposides_remote_data_source.dart';
import 'package:rick_morty_bloc/data/repositories/characters_repository_impl.dart';
import 'package:rick_morty_bloc/domain/repositories/characters_repository.dart';
import 'package:rick_morty_bloc/domain/repositories/episodes_repository.dart';
import 'package:rick_morty_bloc/domain/usecases/get_characters_usecase.dart';
import 'package:rick_morty_bloc/domain/usecases/get_eposides_usecase.dart';
import 'package:rick_morty_bloc/domain/usecases/get_pages_usecase.dart';
import 'package:rick_morty_bloc/presentation/bloc/characters/characters_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_bloc/presentation/bloc/eposides_cubit/eposides_cubit.dart';
import 'package:rick_morty_bloc/presentation/bloc/pages_cubit/pages_cubit.dart';
import 'core/network/network_info.dart';
import 'data/repositories/eposides_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - Characters, Eposides, ...
//Bloc
  sl.registerFactory(() => CharactersBloc(
        getCharctersUseCase: sl(),
      ));

  sl.registerFactory(() => PagesCubit(getPagesUseCase: sl()));
  sl.registerFactory(() => EposidesCubit(getEposidesUsecase: sl()));

//Usecases
  sl.registerLazySingleton(() => GetCharctersUseCase(sl()));
  sl.registerLazySingleton(() => GetPagesUseCase(sl()));
  sl.registerLazySingleton(() => GetEposidesUsecase(sl()));

//Repository
  sl.registerLazySingleton<CharactersRepository>(() => CharactersRepositoryImpl(
      charactersRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<EposidesRepository>(() => EpisodesRepositoryImpl(
      eposidesRemoteDataSource: sl(), networkInfo: sl()));

//Datasources
  sl.registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<EposidesRemoteDataSource>(
      () => EposidesRemoteDataSourceImpl(client: sl()));

//!core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

//!External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
