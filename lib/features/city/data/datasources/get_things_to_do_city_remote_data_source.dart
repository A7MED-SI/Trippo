import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/city/data/models/things_to_do_city_response_model/things_to_do_city_model.dart';

class GetThingsToDoCityRemoteDataSource{
Future<List<ThingsToDoCityModel>> getThingsToDoCity({required Map<String, dynamic> params}) async {
    GetApi getApiThingsToDoCity = GetApi(
      uri: ApiVariables().getThingsToDoCity(params: params),
     fromJson: (jsonString) {
          final mapJson = jsonDecode(jsonString);
          List<ThingsToDoCityModel> thingsToDo = (mapJson['data'] as List).map((thingToDo) => ThingsToDoCityModel.fromJson(thingToDo["data"])).toList();
          return thingsToDo;
              
        },
    );

    return await getApiThingsToDoCity.callRequest();
  }

}