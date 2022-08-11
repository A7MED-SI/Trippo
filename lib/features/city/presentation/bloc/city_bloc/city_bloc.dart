import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trippo/features/city/data/models/city_response_model/city_model.dart';
import 'package:trippo/features/city/data/models/hotels_of_city_response_model/hotels_of_city_model.dart';
import 'package:trippo/features/city/data/models/restaurants_of_city_response_model/restaurants_of_city_model.dart';
import 'package:trippo/features/city/data/models/things_to_do_city_response_model/things_to_do_city_model.dart';
import 'package:trippo/features/city/domain/usecases/get_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_hotels_of_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_restaurants_of_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_things_to_do_city_use_case.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc({
    required GetCityUseCase getCityByIdUseCase,
    required GetHotelsOfCityUseCase getHotelsOfCityUseCase,
    required GetRestaurantsOfCityUseCase getRestaurantsOfCityUseCase,
    required GetThingsToDoCityUseCase getThingsToDoCityUseCase,
  })  : _getCityByIdUseCase = getCityByIdUseCase,
        _getHotelsOfCityUseCase = getHotelsOfCityUseCase,
        _getRestaurantsOfCityUseCase = getRestaurantsOfCityUseCase,
        _getThingsToDoCityUseCase = getThingsToDoCityUseCase,
        super(const CityState()) {
    on<CityEvent>((event, emit) {});
    on<GetCityEvent>(_mapFetchCityEvent);
    on<GetHotelsOfCityEvent>(_mapGetHotelsOfCityEvent);
    on<GetRestaurantsOfCityEvent>(_mapGetRestaurantsOfCityEvent);
    on<GetThingsToDoCityEvent>(_mapGetThingsToDoCityEvent);
  }
  final GetCityUseCase _getCityByIdUseCase;
  final GetHotelsOfCityUseCase _getHotelsOfCityUseCase;
  final GetRestaurantsOfCityUseCase _getRestaurantsOfCityUseCase;
  final GetThingsToDoCityUseCase _getThingsToDoCityUseCase;

  FutureOr<void> _mapFetchCityEvent(
      GetCityEvent event, Emitter<CityState> emit) async {
    emit(state.copyWith(cityStatus: GetCityStatus.loading));
    final _fetchedResult =
        await _getCityByIdUseCase(GetCityParams(id: event.cityId));
    _fetchedResult.fold(
      (fail) => emit(
        state.copyWith(cityStatus: GetCityStatus.failure),
      ),
      (city) => emit(
        state.copyWith(city: city, cityStatus: GetCityStatus.success),
      ),
    );
  }

  FutureOr<void> _mapGetHotelsOfCityEvent(
      GetHotelsOfCityEvent event, Emitter<CityState> emit) async {
    emit(state.copyWith(hotelsOfCityStatus: GetHotelsOfCityStatus.loading));
    final _fetchedResult = await _getHotelsOfCityUseCase(
        GetHotelsOfCityParams(cityId: event.cityId));
    _fetchedResult.fold(
      (fail) => emit(
        state.copyWith(hotelsOfCityStatus: GetHotelsOfCityStatus.failure),
      ),
      (hotels) => emit(
        state.copyWith(
            hotelsOfCity: hotels,
            hotelsOfCityStatus: GetHotelsOfCityStatus.success),
      ),
    );
  }

  FutureOr<void> _mapGetRestaurantsOfCityEvent(
      GetRestaurantsOfCityEvent event, Emitter<CityState> emit) async {
    emit(state.copyWith(
        restaurantsOfCityStatus: GetRestaurantsOfCityStatus.loading));
    final _fetchedResult = await _getRestaurantsOfCityUseCase(
        GetRestaurantsOfCityParams(cityId: event.cityId));
    _fetchedResult.fold(
      (fail) => emit(
        state.copyWith(
            restaurantsOfCityStatus: GetRestaurantsOfCityStatus.failure),
      ),
      (restaurants) => emit(
        state.copyWith(
            restaurantsOfCity: restaurants,
            restaurantsOfCityStatus: GetRestaurantsOfCityStatus.success),
      ),
    );
  }

  FutureOr<void> _mapGetThingsToDoCityEvent(
      GetThingsToDoCityEvent event, Emitter<CityState> emit) async {
    emit(state.copyWith(thingsToDoCityStatus: GetThingsToDoCityStatus.loading));
final _fetchedResult = await _getThingsToDoCityUseCase(
        GetThingsToDoCityParams(cityId: event.cityId));
        _fetchedResult.fold(
      (fail) => emit(
        state.copyWith(
            restaurantsOfCityStatus: GetRestaurantsOfCityStatus.failure),
      ),
      (thingstoDo) => emit(
        state.copyWith(
            thingsToDoCity: thingstoDo,
            thingsToDoCityStatus: GetThingsToDoCityStatus.success),
      ),
    );
      }
}
