import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/city/data/models/city_response_model/city_model.dart';

class GetCityRemoteDataSource {
  Future<CityModel> getCity({required Map<String, dynamic> params}) async {
    GetApi getApiCity = GetApi(
      uri: ApiVariables().getCity(params: params),
      
      fromJson: (String json) => CityModel.fromJson(jsonDecode(json)["data"]["city"]),
    );

    return await getApiCity.callRequest();
  }
}
