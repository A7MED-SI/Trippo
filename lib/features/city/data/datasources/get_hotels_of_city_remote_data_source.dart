import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/city/data/models/hotels_of_city_response_model/hotels_of_city_model.dart';

class GetHotelsOfCityRemoteDataSource {
  Future<List<HotelsOfCityModel>> getHotelsOfCity(
      {required Map<String, dynamic> params}) async {
    GetApi getApiHotelsOfCity = GetApi(
      uri: ApiVariables().getHotelsOfCity(params: params),
      fromJson: (jsonString) {
        final mapJson = jsonDecode(jsonString);
        List<HotelsOfCityModel> hotels = (mapJson['data'] as List)
            .map((hotel) => HotelsOfCityModel.fromJson(hotel["data"]))
            .toList();
        return hotels;
      },
    );

    return await getApiHotelsOfCity.callRequest();
  }
}
