import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/data/models/things_to_do_city_response_model/things_to_do_city_model.dart';
import 'package:trippo/features/city/domain/repositories/get_city_repository.dart';

class GetThingsToDoCityUseCase
    implements UseCase<List<ThingsToDoCityModel>, GetThingsToDoCityParams> {
  final GetCityRepository _getCityRepository;

  GetThingsToDoCityUseCase({required GetCityRepository getCityRepository})
      : _getCityRepository = getCityRepository;

  @override
  Future<Either<Failure, List<ThingsToDoCityModel>>> call(
      GetThingsToDoCityParams params) async {
    return await _getCityRepository.getThingsToDoCity(
        params: params.getParamsMap());
  }
}

class GetThingsToDoCityParams {
  final int cityId;

  GetThingsToDoCityParams({required this.cityId});

  Map<String, dynamic> getParamsMap() {
    return {
      "id": cityId.toString(),
    };
  }
}
