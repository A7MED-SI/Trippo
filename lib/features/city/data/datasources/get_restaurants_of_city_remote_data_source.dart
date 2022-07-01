import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/city/data/models/restaurants_of_city_response_model/restaurants_of_city_model.dart';

class GetRestaurantsOfCityRemoteDataSource {
  Future<List<RestaurantsOfCityModel>> getRestaurantsOfCity(
      {required Map<String, dynamic> params}) async {
    GetApi getApiRestaurantsOfCity = GetApi(
      uri: ApiVariables().getRestaurantsOfCity(params: params),
      fromJson: (jsonString) {
        final mapJson = jsonDecode(jsonString);
        List<RestaurantsOfCityModel> restaurants = (mapJson['data'] as List)
            .map((restaurant) =>
                RestaurantsOfCityModel.fromJson(restaurant["data"]))
            .toList();
        return restaurants;
      },
    );

    return await getApiRestaurantsOfCity.callRequest();
  }
}
