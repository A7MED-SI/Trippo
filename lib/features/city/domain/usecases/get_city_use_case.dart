import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/data/models/city_response_model/city_model.dart';
import 'package:trippo/features/city/domain/repositories/get_city_repository.dart';

class GetCityUseCase implements UseCase<CityModel, GetCityParams> {
  final GetCityRepository _getCityRepository;

  GetCityUseCase({required GetCityRepository getCityRepository})
      : _getCityRepository = getCityRepository;

  @override
  Future<Either<Failure, CityModel>> call(GetCityParams params) async {
    return await _getCityRepository.getCityById(params: params.getParamsMap());
  }
}

class GetCityParams {
  final int id;

  GetCityParams({required this.id});

  Map<String, dynamic> getParamsMap() {
    return {
      "id": id.toString(),
    };
  }
}
