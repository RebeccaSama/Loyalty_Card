import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
    List<Error> errors;

    InvoiceModel({
        required this.errors,
    });

    factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
    };
}

class Error {
    String type;
    dynamic value;
    String msg;
    String path;
    String location;

    Error({
        required this.type,
        required this.value,
        required this.msg,
        required this.path,
        required this.location,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        type: json["type"],
        value: json["value"],
        msg: json["msg"],
        path: json["path"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
        "msg": msg,
        "path": path,
        "location": location,
    };
}
