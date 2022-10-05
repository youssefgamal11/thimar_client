// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.data,
    this.status,
    this.message,
  });

  Data? data;
  String? status;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "status": status,
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.fullname,
    this.phone,
    this.email,
    this.image,
    this.isBan,
    this.isActive,
    this.unreadNotifications,
    this.userType,
    this.token,
    this.country,
    this.city,
    this.identityNumber,
    this.userCartCount,
  });

  int? id;
  String? fullname;
  String? phone;
  String? email;
  String? image;
  int? isBan;
  bool? isActive;
  int? unreadNotifications;
  String? userType;
  String? token;
  Country? country;
  City? city;
  dynamic identityNumber;
  int? userCartCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        isBan: json["is_ban"],
        isActive: json["is_active"],
        unreadNotifications: json["unread_notifications"],
        userType: json["user_type"],
        token: json["token"],
        country: Country.fromJson(json["country"]),
        city: City.fromJson(json["city"]),
        identityNumber: json["identity_number"],
        userCartCount: json["user_cart_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "image": image,
        "is_ban": isBan,
        "is_active": isActive,
        "unread_notifications": unreadNotifications,
        "user_type": userType,
        "token": token,
        "country": country!.toJson(),
        "city": city!.toJson(),
        "identity_number": identityNumber,
        "user_cart_count": userCartCount,
      };
}

class City {
  City({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.nationality,
    this.key,
    this.flag,
  });

  String? id;
  String? name;
  String? nationality;
  String? key;
  String? flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        nationality: json["nationality"],
        key: json["key"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nationality": nationality,
        "key": key,
        "flag": flag,
      };
}
