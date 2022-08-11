part of 'city_images_bloc.dart';

enum CityImagesStatus { initail, loading, success, failuer }

class CityImagesState {
  CityImagesState({this.cityImagesStatus=CityImagesStatus.initail , this.cityImages = const[], this.hasReachMax = false,});

  final CityImagesStatus cityImagesStatus;
  final List<ImageModel>cityImages;
  final bool hasReachMax;
  CityImagesState copyWith({
    CityImagesStatus? cityImagesStatus,
    List<ImageModel>? cityImages,
    bool? hasReachMax,
  }) {
    return CityImagesState(
      cityImages: cityImages ?? this.cityImages,
      cityImagesStatus: cityImagesStatus ?? this.cityImagesStatus,
      hasReachMax: hasReachMax ?? this.hasReachMax,
    );
  }
}
