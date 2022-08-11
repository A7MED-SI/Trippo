import 'dart:convert';

import 'package:trippo/core/features/ImageFeature/data/models/image_model.dart';
import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';

class GetPlaceImageRemoteDataSource{
  Future<List<ImageModel>> getPlaceImages({required Map<String, dynamic> params}) async {
    GetApi getApiImageCity = GetApi(
      uri: ApiVariables().getPalceImages(params: params),
      //TODO: check from json decode
      fromJson: (String json) => ImageModel.fromJson(jsonDecode(json)["data"]),
    );

    return await getApiImageCity.callRequest();
  }
}