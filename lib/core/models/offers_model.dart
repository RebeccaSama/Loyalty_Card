import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
    String message;
    Offer offer;

    OffersModel({
        required this.message,
        required this.offer,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        message: json["message"],
        offer: Offer.fromJson(json["offer"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "offer": offer.toJson(),
    };
}

class Offer {
    String title;
    String description;
    int discount;
    DateTime startDate;
    DateTime endDate;
    String targetAudience;
    bool isActive;
    String id;
    int v;

    Offer({
        required this.title,
        required this.description,
        required this.discount,
        required this.startDate,
        required this.endDate,
        required this.targetAudience,
        required this.isActive,
        required this.id,
        required this.v,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        title: json["title"],
        description: json["description"],
        discount: json["discount"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        targetAudience: json["targetAudience"],
        isActive: json["isActive"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "discount": discount,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "targetAudience": targetAudience,
        "isActive": isActive,
        "_id": id,
        "__v": v,
    };
}
