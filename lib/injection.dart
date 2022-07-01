import 'package:get_it/get_it.dart';
import 'package:trippo/features/city/data/datasources/get_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_hotels_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_restaurants_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_things_to_do_city_remote_data_source.dart';
import 'package:trippo/features/city/data/repositories/get_city_repository_impl.dart';
import 'package:trippo/features/city/domain/repositories/get_city_repository.dart';
import 'package:trippo/features/city/domain/usecases/get_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_hotels_of_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_restaurants_of_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_things_to_do_city_use_case.dart';
import 'package:trippo/features/city/presentation/bloc/city_bloc.dart';

import 'features/main/presentation/bloc/page_manager/page_manager_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async => appDependencies();

Future<void> appDependencies() async {
  //! Features - main
    //blocs
      serviceLocator.registerFactory(
        () => PageManagerBloc(),
      );
  //! Features - city
    //blocs
      serviceLocator.registerFactory(
        () => CityBloc(
          getCityByIdUseCase: serviceLocator(),
          getHotelsOfCityUseCase: serviceLocator(),
          getRestaurantsOfCityUseCase: serviceLocator(),
          getThingsToDoCityUseCase: serviceLocator(),
        ),
      );
    //useCases
      serviceLocator.registerLazySingleton(
        () => GetCityUseCase(getCityRepository: serviceLocator()),
      );
      serviceLocator.registerLazySingleton(
        () => GetHotelsOfCityUseCase(getCityRepository: serviceLocator()),
      );
      serviceLocator.registerLazySingleton(
        () => GetRestaurantsOfCityUseCase(getCityRepository: serviceLocator()),
      );
      serviceLocator.registerLazySingleton(
        () => GetThingsToDoCityUseCase(getCityRepository: serviceLocator()),
      );
    //repositories
      serviceLocator.registerLazySingleton<GetCityRepository>(
        () => GetCityRepositoryImpl(
          getCityRemoteDataSource: serviceLocator(),
          getHotelsOfCityRemoteDataSource: serviceLocator(),
          getRestaurantsOfCityRemoteDataSource: serviceLocator(),
          getThingsToDoCityRemoteDataSource: serviceLocator(),
        ),
      );
    //dataSources
      serviceLocator.registerLazySingleton(
        () => GetCityRemoteDataSource(),
      );
      serviceLocator.registerLazySingleton(
        () => GetHotelsOfCityRemoteDataSource(),
      );
      serviceLocator.registerLazySingleton(
        () => GetRestaurantsOfCityRemoteDataSource(),
      );
      serviceLocator.registerLazySingleton(
        () => GetThingsToDoCityRemoteDataSource(),
      );
}
