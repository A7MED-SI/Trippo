
  import 'package:json_annotation/json_annotation.dart';
  part 'image_model.g.dart';

  @JsonSerializable()
  class ImageModel{
  factory ImageModel.fromJson(Map<String, dynamic> json) {
      return _$ImageModelFromJson(json);
    }
 ImageModel({
        this.id,
        this.url,
        this.order,
        this.hash,
    });

    final String? id;
    final String? url;
    final String? order;
    final String ?hash;


    Map<String, dynamic> toJson() {
      return _$ImageModelToJson(this);
    }
  }