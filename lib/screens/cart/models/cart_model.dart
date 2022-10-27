import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.data,
    this.totalPriceBeforeDiscount,
    this.totalDiscount,
    this.totalPriceWithVat,
    this.deliveryCost,
    this.freeDeliveryPrice,
    this.vat,
    this.isVip,
    this.vipDiscountPercentage,
    this.minVipPrice,
    this.vipMessage,
    this.status,
    this.message,
  });

  final List<Datum>? data;
  final int? totalPriceBeforeDiscount;
  final double? totalDiscount;
  final double? totalPriceWithVat;
  final int? deliveryCost;
  final int? freeDeliveryPrice;
  final double? vat;
  final int? isVip;
  final int? vipDiscountPercentage;
  final int? minVipPrice;
  final String? vipMessage;
  final String? status;
  final String? message;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalPriceBeforeDiscount: json["total_price_before_discount"],
        totalDiscount: json["total_discount"].toDouble(),
        totalPriceWithVat: json["total_price_with_vat"].toDouble(),
        deliveryCost: json["delivery_cost"],
        freeDeliveryPrice: json["free_delivery_price"],
        vat: json["vat"].toDouble(),
        isVip: json["is_vip"],
        vipDiscountPercentage: json["vip_discount_percentage"],
        minVipPrice: json["min_vip_price"],
        vipMessage: json["vip_message"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total_price_before_discount": totalPriceBeforeDiscount,
        "total_discount": totalDiscount,
        "total_price_with_vat": totalPriceWithVat,
        "delivery_cost": deliveryCost,
        "free_delivery_price": freeDeliveryPrice,
        "vat": vat,
        "is_vip": isVip,
        "vip_discount_percentage": vipDiscountPercentage,
        "min_vip_price": minVipPrice,
        "vip_message": vipMessage,
        "status": status,
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.image,
    this.amount,
    this.priceBeforeDiscount,
    this.discount,
    this.price,
    this.remainingAmount,
  });

  final int? id;
  final String? title;
  final String? image;
  final int? amount;
  final int? priceBeforeDiscount;
  final int? discount;
  final double? price;
  final int? remainingAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        amount: json["amount"],
        priceBeforeDiscount: json["price_before_discount"],
        discount: json["discount"],
        price: json["price"].toDouble(),
        remainingAmount: json["remaining_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "amount": amount,
        "price_before_discount": priceBeforeDiscount,
        "discount": discount,
        "price": price,
        "remaining_amount": remainingAmount,
      };
}
