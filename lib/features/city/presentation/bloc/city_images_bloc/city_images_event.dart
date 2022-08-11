part of 'city_images_bloc.dart';

abstract class CityImagesEvent  {
  const CityImagesEvent();

  
}

class GetCityImageEvent extends CityImagesEvent{
  final int cityId;

  GetCityImageEvent({required this.cityId});
}
