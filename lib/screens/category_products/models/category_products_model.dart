import 'dart:convert';

CategoryProductsModel categoryProductsModelFromJson(String str) =>
    CategoryProductsModel.fromJson(json.decode(str));

String categoryProductsModelToJson(CategoryProductsModel data) =>
    json.encode(data.toJson());

class CategoryProductsModel {
  CategoryProductsModel({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.message,
  });

  final List<Datum>? data;
  final Links? links;
  final Meta? meta;
  final String? status;
  final String? message;

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
        "status": status,
        "message": message,
      };
}

class Datum {
  Datum({
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
  final double? price;
  final double? discount;
  final int? amount;
  final int? isActive;
  final bool? isFavorite;
  final Unit? unit;
  final List<Image>? images;
  final String? mainImage;
  final DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        code: json["code"],
        priceBeforeDiscount: json["price_before_discount"],
        price: json["price"].toDouble(),
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

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  final String? first;
  final String? last;
  final dynamic? prev;
  final dynamic? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
