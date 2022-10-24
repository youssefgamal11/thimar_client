import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.data,
    this.status,
    this.message,
  });

  final List<Datum>? data;
  final String? status;
  final String? message;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.media,
  });

  final int? id;
  final String? media;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media": media,
      };
}
