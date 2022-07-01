part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class GetCityEvent extends CityEvent {
  const GetCityEvent({required this.cityId});
  final int cityId;
  @override
  List<Object> get props => [cityId];
}
class GetHotelsOfCityEvent extends CityEvent {
  const GetHotelsOfCityEvent({required this.cityId});
  final int cityId;
  @override
  List<Object> get props => [cityId];
}
class GetRestaurantsOfCityEvent extends CityEvent {
  const GetRestaurantsOfCityEvent({required this.cityId});
  final int cityId;
  @override
  List<Object> get props => [cityId];
}
class GetThingsToDoCityEvent extends CityEvent {
  const GetThingsToDoCityEvent({required this.cityId});
  final int cityId;
  @override
  List<Object> get props => [cityId];
}