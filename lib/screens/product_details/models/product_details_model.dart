import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
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
    this.categoryId,
    this.id,
    this.title,
    this.description,
    this.code,
    this.priceBeforeDiscount,
    this.price,
    this.discount,
    this.amount,
    this.isActive,
    this.isFavorite,
    this.unit,
    this.images,
    this.mainImage,
    this.createdAt,
  });

  final int? categoryId;
  final int? id;
  final String? title;
  final String? description;
  final String? code;
  final int? priceBeforeDiscount;
  var price;
  final double? discount;
  final int? amount;
  final int? isActive;
  final bool? isFavorite;
  final Unit? unit;
  final List<Image>? images;
  final String? mainImage;
  final DateTime? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryId: json["category_id"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        code: json["code"],
        priceBeforeDiscount: json["price_before_discount"],
        price: json["price"],
        discount: json["discount"].toDouble(),
        amount: json["amount"],
        isActive: json["is_active"],
        isFavorite: json["is_favorite"],
        unit: Unit.fromJson(json["unit"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        mainImage: json["main_image"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "id": id,
        "title": title,
        "description": description,
        "code": code,
        "price_before_discount": priceBeforeDiscount,
        "price": price,
        "discount": discount,
        "amount": amount,
        "is_active": isActive,
        "is_favorite": isFavorite,
        "unit": unit!.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "main_image": mainImage,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
      };
}

class Image {
  Image({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Unit {
  Unit({
    this.id,
    this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
