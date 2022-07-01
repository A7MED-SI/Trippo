import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/data/models/restaurants_of_city_response_model/restaurants_of_city_model.dart';
import 'package:trippo/features/city/domain/repositories/get_city_repository.dart';

class GetRestaurantsOfCityUseCase implements UseCase<List<RestaurantsOfCityModel>, GetRestaurantsOfCityParams> {
  final GetCityRepository _getCityRepository;

  GetRestaurantsOfCityUseCase({required GetCityRepository getCityRepository})
      : _getCityRepository = getCityRepository;

  @override
  Future<Either<Failure, List<RestaurantsOfCityModel>>> call(GetRestaurantsOfCityParams params) async {
    return await _getCityRepository.getRestaurantsOfCity(params: params.getParamsMap());
  }
}

class GetRestaurantsOfCityParams {
  final int cityId;

  GetRestaurantsOfCityParams({required this.cityId});

  Map<String, dynamic> getParamsMap() {
    return {
      "id": cityId.toString(),
    };
  }
}
