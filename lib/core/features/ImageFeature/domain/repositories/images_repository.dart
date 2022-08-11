import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/features/ImageFeature/data/models/image_model.dart';

abstract class ImagesRepository {
  Future<Either<Failure, List<ImageModel>>> getCityImages(
      {required Map<String, dynamic> params});
      Future<Either<Failure, List<ImageModel>>> getPlaceImages(
      {required Map<String, dynamic> params});
}
