import 'dart:convert';

DeleteProductModel deleteProductModelFromJson(String str) =>
    DeleteProductModel.fromJson(json.decode(str));

String deleteProductModelToJson(DeleteProductModel data) =>
    json.encode(data.toJson());

class DeleteProductModel {
  DeleteProductModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final dynamic? data;

  factory DeleteProductModel.fromJson(Map<String, dynamic> json) =>
      DeleteProductModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
