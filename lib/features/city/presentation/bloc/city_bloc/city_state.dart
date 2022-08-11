part of 'city_bloc.dart';

enum GetCityStatus {
  initial,
  loading,
  success,
  failure,
}
enum GetHotelsOfCityStatus {
  initial,
  loading,
  success,
  failure,
}
enum GetRestaurantsOfCityStatus {
  initial,
  loading,
  success,
  failure,
}
enum GetThingsToDoCityStatus {
  initial,
  loading,
  success,
  failure,
}

class CityState {
  const CityState(
      {this.hotelsOfCity = const [],
      this.restaurantsOfCity = const [],
      this.thingsToDoCity = const [],
      this.hotelsOfCityStatus = GetHotelsOfCityStatus.initial,
      this.restaurantsOfCityStatus = GetRestaurantsOfCityStatus.initial,
      this.thingsToDoCityStatus = GetThingsToDoCityStatus.initial,
      this.city = const CityModel(),
      this.cityStatus = GetCityStatus.initial});
  final CityModel city;
  final List<HotelsOfCityModel> hotelsOfCity;
  final List<RestaurantsOfCityModel> restaurantsOfCity;
  final List<ThingsToDoCityModel> thingsToDoCity;
  final GetCityStatus cityStatus;
  final GetHotelsOfCityStatus hotelsOfCityStatus;
  final GetRestaurantsOfCityStatus restaurantsOfCityStatus;
  final GetThingsToDoCityStatus thingsToDoCityStatus;

  CityState copyWith({
    CityModel? city,
    GetCityStatus? cityStatus,
     List<HotelsOfCityModel>? hotelsOfCity,
   List<RestaurantsOfCityModel>? restaurantsOfCity,
   List<ThingsToDoCityModel>? thingsToDoCity,
  GetHotelsOfCityStatus? hotelsOfCityStatus,
   GetRestaurantsOfCityStatus ?restaurantsOfCityStatus,
   GetThingsToDoCityStatus? thingsToDoCityStatus,
  }) {
    return CityState(
      city: city ?? this.city,
      cityStatus: cityStatus ?? this.cityStatus,
      hotelsOfCity: hotelsOfCity ?? this.hotelsOfCity,
      hotelsOfCityStatus: hotelsOfCityStatus ?? this.hotelsOfCityStatus,
      restaurantsOfCity: restaurantsOfCity ?? this.restaurantsOfCity,
      restaurantsOfCityStatus: restaurantsOfCityStatus ?? this.restaurantsOfCityStatus,
      thingsToDoCity: thingsToDoCity ?? this.thingsToDoCity,
      thingsToDoCityStatus: thingsToDoCityStatus ?? this.thingsToDoCityStatus,

    );
  }
}
