import '../../../../models/city_model.dart';

class CityDataModel {
  String? status;
  String? message;
  List<City>? data;
  CityDataModel({this.data, this.message, this.status});
  factory CityDataModel.fromJson(Map<String, dynamic> json) => CityDataModel(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        data: json["data"] == null
            ? null
            : List<City>.from(json["data"].map((x) => City.fromJson(x))),
      );
}
