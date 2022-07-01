import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';
import 'package:trippo/features/city/data/datasources/get_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_hotels_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_restaurants_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_things_to_do_city_remote_data_source.dart';
import 'package:trippo/features/city/data/models/city_response_model/city_model.dart';
import 'package:trippo/features/city/data/models/things_to_do_city_response_model/things_to_do_city_model.dart';
import 'package:trippo/features/city/data/models/restaurants_of_city_response_model/restaurants_of_city_model.dart';
import 'package:trippo/features/city/data/models/hotels_of_city_response_model/hotels_of_city_model.dart';
import 'package:trippo/features/city/domain/repositories/get_city_repository.dart';

class GetCityRepositoryImpl
    with HandlingExceptionManager
    implements GetCityRepository {
  final GetCityRemoteDataSource _getCityRemoteDataSource;
  final GetHotelsOfCityRemoteDataSource _getHotelsOfCityRemoteDataSource;
  final GetRestaurantsOfCityRemoteDataSource
      _getRestaurantsOfCityRemoteDataSource;
  final GetThingsToDoCityRemoteDataSource _getThingsToDoCityRemoteDataSource;

  GetCityRepositoryImpl({
    required GetCityRemoteDataSource getCityRemoteDataSource,
    required GetHotelsOfCityRemoteDataSource getHotelsOfCityRemoteDataSource,
    required GetRestaurantsOfCityRemoteDataSource
        getRestaurantsOfCityRemoteDataSource,
    required GetThingsToDoCityRemoteDataSource
        getThingsToDoCityRemoteDataSource,
  })  : _getCityRemoteDataSource = getCityRemoteDataSource,
        _getHotelsOfCityRemoteDataSource = getHotelsOfCityRemoteDataSource,
        _getRestaurantsOfCityRemoteDataSource =
            getRestaurantsOfCityRemoteDataSource,
        _getThingsToDoCityRemoteDataSource = getThingsToDoCityRemoteDataSource;

  @override
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params}) async {
    return await wrapHandling(tryCall: () async {
      final city = await _getCityRemoteDataSource.getCity(params: params);
      return Right(city);
    });
  }

  @override
  Future<Either<Failure, List<HotelsOfCityModel>>> getHotelsOfCity(
      {required Map<String, dynamic> params})async {
    return await wrapHandling(tryCall: () async {
      final hotels = await _getHotelsOfCityRemoteDataSource.getHotelsOfCity(params: params);
      return Right(hotels);
    });
  }

  @override
  Future<Either<Failure, List<RestaurantsOfCityModel>>> getRestaurantsOfCity(
      {required Map<String, dynamic> params})async {
     return await wrapHandling(tryCall: () async {
      final restaurant = await _getRestaurantsOfCityRemoteDataSource.getRestaurantsOfCity(params: params);
      return Right(restaurant);
    });
  }

  @override
  Future<Either<Failure, List<ThingsToDoCityModel>>> getThingsToDoCity(
      {required Map<String, dynamic> params}) async{
    return await wrapHandling(tryCall: () async {
      final thingsToDo = await _getThingsToDoCityRemoteDataSource.getThingsToDoCity(params: params);
      return Right(thingsToDo);
    });
  }
}
