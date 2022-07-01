import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/city/data/models/city_response_model/city_model.dart';
import 'package:trippo/features/city/data/models/hotels_of_city_response_model/hotels_of_city_model.dart';
import 'package:trippo/features/city/data/models/restaurants_of_city_response_model/restaurants_of_city_model.dart';
import 'package:trippo/features/city/data/models/things_to_do_city_response_model/things_to_do_city_model.dart';

abstract class GetCityRepository {
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params});
  Future<Either<Failure, List<HotelsOfCityModel>>> getHotelsOfCity(
      {required Map<String, dynamic> params});
  Future<Either<Failure, List<RestaurantsOfCityModel>>> getRestaurantsOfCity(
      {required Map<String, dynamic> params});
  Future<Either<Failure, List<ThingsToDoCityModel>>> getThingsToDoCity(
      {required Map<String, dynamic> params});
}
