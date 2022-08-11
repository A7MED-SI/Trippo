import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/features/ImageFeature/data/datasources/get_city_image_remote_data_source.dart';
import 'package:trippo/core/features/ImageFeature/data/datasources/get_palce_image_remote_data_source.dart';
import 'package:trippo/core/features/ImageFeature/data/models/image_model.dart';
import 'package:trippo/core/features/ImageFeature/domain/repositories/images_repository.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';

class ImagesRepositoryImpl
    with HandlingExceptionManager
    implements ImagesRepository {
  final GetCityImageRemoteDataSource getCityImageRemoteDataSource;
final GetPlaceImageRemoteDataSource getPlaceImageRemoteDataSource;
  ImagesRepositoryImpl( {required this.getPlaceImageRemoteDataSource,required this.getCityImageRemoteDataSource});
  @override
  Future<Either<Failure, List<ImageModel>>> getCityImages(
      {required Map<String, dynamic> params}) async {
    return await wrapHandling<List<ImageModel>>(tryCall: () async {
      final model =
          await getCityImageRemoteDataSource.getCityImages(params: params);
      return Right(model);
    });
  }

  @override
  Future<Either<Failure, List<ImageModel>>> getPlaceImages({required Map<String, dynamic> params})async {
    return await wrapHandling<List<ImageModel>>(tryCall: () async {
      final model =
          await getPlaceImageRemoteDataSource.getPlaceImages(params: params);
      return Right(model);
    });
  }
}
