// To parse this JSON data, do
//
//     final plantObject = plantObjectFromMap(jsonString);

import 'dart:convert';

List<PlantObject> plantObjectFromMap(dynamic str) =>
    List<PlantObject>.from(str.map((x) => PlantObject.fromMap(x)));

String plantObjectToMap(List<PlantObject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PlantObject {
  int id;
  String commonName;
  List<String> scientificName;
  List<String> otherName;
  String cycle;
  String watering;
  List<String> sunlight;
  DefaultImage defaultImage;

  PlantObject({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.otherName,
    required this.cycle,
    required this.watering,
    required this.sunlight,
    required this.defaultImage,
  });

  factory PlantObject.fromMap(Map<String, dynamic> json) => PlantObject(
        id: json["id"],
        commonName: json["common_name"],
        scientificName:
            List<String>.from(json["scientific_name"].map((x) => x)),
        otherName: List<String>.from(json["other_name"].map((x) => x)),
        cycle: json["cycle"],
        watering: json["watering"],
        sunlight: List<String>.from(json["sunlight"].map((x) => x)),
        defaultImage: DefaultImage.fromMap(json["default_image"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "common_name": commonName,
        "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
        "other_name": List<dynamic>.from(otherName.map((x) => x)),
        "cycle": cycle,
        "watering": watering,
        "sunlight": List<dynamic>.from(sunlight.map((x) => x)),
        "default_image": defaultImage.toMap(),
      };
}

class DefaultImage {
  int license;
  String licenseName;
  String licenseUrl;
  String originalUrl;
  String regularUrl;
  String mediumUrl;
  String smallUrl;
  String thumbnail;

  DefaultImage({
    required this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    required this.regularUrl,
    required this.mediumUrl,
    required this.smallUrl,
    required this.thumbnail,
  });

  factory DefaultImage.fromMap(Map<String, dynamic> json) => DefaultImage(
        license: json["license"],
        licenseName: json["license_name"],
        licenseUrl: json["license_url"],
        originalUrl: json["original_url"],
        regularUrl: json["regular_url"],
        mediumUrl: json["medium_url"],
        smallUrl: json["small_url"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "license": license,
        "license_name": licenseName,
        "license_url": licenseUrl,
        "original_url": originalUrl,
        "regular_url": regularUrl,
        "medium_url": mediumUrl,
        "small_url": smallUrl,
        "thumbnail": thumbnail,
      };
}
