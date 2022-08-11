import 'dart:developer';

import 'package:trippo/core/constants/apis/api_url.dart';
import 'package:trippo/core/unified_api/get_api.dart';

class ApiVariables {
  final _scheme = 'http';
  final _host = '192.168.137.1';
  final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      port: _port,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString());
    return uri;
  }

Uri getPalceImages({required Map<String, dynamic> params}){
    return _mainUri(path: ApiUrls.getPlaceImages,queryParameters: params);
  }
  Uri getCityImages({required Map<String, dynamic> params}){
    return _mainUri(path: ApiUrls.getCityImages,queryParameters: params);
  }

  Uri getCity({required Map<String, dynamic> params}) {
    return _mainUri(path: ApiUrls.getCityById, queryParameters: params);
  }

  Uri getHotelsOfCity({required Map<String, dynamic> params}) {
    return _mainUri(path: ApiUrls.getHotelsOfCity, queryParameters: params);
  }

  Uri getRestaurantsOfCity({required Map<String, dynamic> params}) {
    return _mainUri(path: ApiUrls.getRestaurantsOfCity, queryParameters: params);
  }

  Uri getThingsToDoCity({required Map<String, dynamic> params}) {
    return _mainUri(path: ApiUrls.getThingsToDoOfCity, queryParameters: params);
  }
}
