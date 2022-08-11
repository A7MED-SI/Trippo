import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/features/ImageFeature/data/models/image_model.dart';
import 'package:trippo/core/features/ImageFeature/domain/repositories/images_repository.dart';
import 'package:trippo/core/use_case/use_case.dart';

class GetPlaceImagesUseCase
    implements UseCase<List<ImageModel>, PlaceImagesParam> {
  GetPlaceImagesUseCase({required this.imagesRepo});

  final ImagesRepository imagesRepo;

  @override
  Future<Either<Failure, List<ImageModel>>> call(
      PlaceImagesParam params) async {
    return await imagesRepo.getPlaceImages(params: params.getParam());
  }
}

class PlaceImagesParam {
  Map<String, dynamic> getParam() {
    return {};
  }
}
