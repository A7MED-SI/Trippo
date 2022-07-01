import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  const  CityModel({
        this.id,
        this.name,
        this.description,
        this.latitude,
        this.longitude,
    });

    final int? id;
    final String? name;
    final String? description;
    final String? latitude;
    final String? longitude;

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "name": name,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
    };
}
