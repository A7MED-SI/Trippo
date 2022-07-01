import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/data/models/hotels_of_city_response_model/hotels_of_city_model.dart';
import 'package:trippo/features/city/domain/repositories/get_city_repository.dart';

class GetHotelsOfCityUseCase implements UseCase<List<HotelsOfCityModel>, GetHotelsOfCityParams> {
  final GetCityRepository _getCityRepository;

  GetHotelsOfCityUseCase({required GetCityRepository getCityRepository})
      : _getCityRepository = getCityRepository;

  @override
  Future<Either<Failure, List<HotelsOfCityModel>>> call(GetHotelsOfCityParams params) async {
    return await _getCityRepository.getHotelsOfCity(params: params.getParamsMap());
  }
}

class GetHotelsOfCityParams {
  final int cityId;

  GetHotelsOfCityParams({required this.cityId});

  Map<String, dynamic> getParamsMap() {
    return {
      "id": cityId.toString(),
    };
  }
}
