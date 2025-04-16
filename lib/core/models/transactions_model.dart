import 'dart:convert';

TransactionsModel transactionsModelFromJson(String str) => TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) => json.encode(data.toJson());

class TransactionsModel {
    String message;
    Error error;

    TransactionsModel({
        required this.message,
        required this.error,
    });

    factory TransactionsModel.fromJson(Map<String, dynamic> json) => TransactionsModel(
        message: json["message"],
        error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "error": error.toJson(),
    };
}

class Error {
    Errors errors;
    String message;
    String name;
    String errorMessage;

    Error({
        required this.errors,
        required this.message,
        required this.name,
        required this.errorMessage,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        errors: Errors.fromJson(json["errors"]),
        message: json["_message"],
        name: json["name"],
        errorMessage: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "errors": errors.toJson(),
        "_message": message,
        "name": name,
        "message": errorMessage,
    };
}

class Errors {
    UserId userId;

    Errors({
        required this.userId,
    });

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        userId: UserId.fromJson(json["userId"]),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId.toJson(),
    };
}

class UserId {
    String stringValue;
    String valueType;
    String kind;
    String value;
    String path;
    Reason reason;
    String name;
    String message;

    UserId({
        required this.stringValue,
        required this.valueType,
        required this.kind,
        required this.value,
        required this.path,
        required this.reason,
        required this.name,
        required this.message,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        stringValue: json["stringValue"],
        valueType: json["valueType"],
        kind: json["kind"],
        value: json["value"],
        path: json["path"],
        reason: Reason.fromJson(json["reason"]),
        name: json["name"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
        "valueType": valueType,
        "kind": kind,
        "value": value,
        "path": path,
        "reason": reason.toJson(),
        "name": name,
        "message": message,
    };
}

class Reason {
    Reason();

    factory Reason.fromJson(Map<String, dynamic> json) => Reason(
    );

    Map<String, dynamic> toJson() => {
    };
}
