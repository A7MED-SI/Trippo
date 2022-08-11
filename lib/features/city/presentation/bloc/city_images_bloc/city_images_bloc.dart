import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:trippo/core/features/ImageFeature/data/models/image_model.dart';
import 'package:trippo/core/features/ImageFeature/domain/usecases/get_city_images_use_case.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'city_images_event.dart';
part 'city_images_state.dart';

class CityImagesBloc extends Bloc<CityImagesEvent, CityImagesState> {
  CityImagesBloc({this.getCityImagesUseCase}) : super(CityImagesState()) {
    on<CityImagesEvent>((event, emit) {
     
    });
 on<GetCityImageEvent>(_mapGetCityImageEvent,
        transformer: throttleDroppable(throttleDuration));
   
  } 
  static const throttleDuration = Duration(milliseconds: 200);

  final GetCityImagesUseCase?  getCityImagesUseCase;
 EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }
  _mapGetCityImageEvent(GetCityImageEvent event,Emitter<CityImagesState>emit)async{

     log('endPage: ${state.hasReachMax}');
    if (state.hasReachMax) return;
    final result = await getCityImagesUseCase!(CityImagesParam(
     pageNumber : state.cityImages.isNotEmpty
          ? state.cityImages.length ~/ 15
          : 0 ~/ 15,
     
     cityId : event.cityId,
    ));

    result.fold(
        (l) => emit(state.copyWith(cityImagesStatus:  CityImagesStatus.failuer)),
        (images) {
      return emit(
        state.copyWith(
            cityImagesStatus: CityImagesStatus.success,
            hasReachMax: (images.length) < 15,
            cityImages: List.of(state.cityImages)..addAll(images)),
      );
    });

  }

}
