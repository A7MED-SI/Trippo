import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/features/ImageFeature/data/models/image_model.dart';
import 'package:trippo/core/features/ImageFeature/domain/repositories/images_repository.dart';
import 'package:trippo/core/use_case/use_case.dart';

class GetCityImagesUseCase
    implements UseCase<List<ImageModel>, CityImagesParam> {
  GetCityImagesUseCase({required this.imagesRepo});

  final ImagesRepository imagesRepo;

  @override
  Future<Either<Failure, List<ImageModel>>> call(CityImagesParam params) async {
    return await imagesRepo.getCityImages(params: params.getParam());
  }
}
class CityImagesParam{
final int cityId;
final int pageNumber;

  CityImagesParam( {required this.cityId,required this.pageNumber,});
Map<String,dynamic> getParam(){
  return{
    'cityId':cityId,
    'pageNumber':pageNumber,
  };
}
}