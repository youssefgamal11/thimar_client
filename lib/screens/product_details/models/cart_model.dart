import 'dart:convert';

PutIntoCartModel putIntoCartModelFromJson(String str) =>
    PutIntoCartModel.fromJson(json.decode(str));

String putIntoCartModelToJson(PutIntoCartModel data) =>
    json.encode(data.toJson());

class PutIntoCartModel {
  PutIntoCartModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory PutIntoCartModel.fromJson(Map<String, dynamic> json) =>
      PutIntoCartModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.title,
    this.image,
    this.amount,
    this.deliveryCost,
    this.price,
  });

  final String? title;
  final String? image;
  final int? amount;
  final int? deliveryCost;
  final int? price;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        image: json["image"],
        amount: json["amount"],
        deliveryCost: json["delivery_cost"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "amount": amount,
        "delivery_cost": deliveryCost,
        "price": price,
      };
}
