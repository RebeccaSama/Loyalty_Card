
import 'dart:convert';

ReportsModel reportsModelFromJson(String str) => ReportsModel.fromJson(json.decode(str));

String reportsModelToJson(ReportsModel data) => json.encode(data.toJson());

class ReportsModel {
    String message;
    Report report;

    ReportsModel({
        required this.message,
        required this.report,
    });

    factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
        message: json["message"],
        report: Report.fromJson(json["report"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "report": report.toJson(),
    };
}

class Report {
    String reportType;
    Data data;
    String id;
    DateTime createdAt;
    int v;

    Report({
        required this.reportType,
        required this.data,
        required this.id,
        required this.createdAt,
        required this.v,
    });

    factory Report.fromJson(Map<String, dynamic> json) => Report(
        reportType: json["reportType"],
        data: Data.fromJson(json["data"]),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "reportType": reportType,
        "data": data.toJson(),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class Data {
    int totalSales;

    Data({
        required this.totalSales,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalSales: json["totalSales"],
    );

    Map<String, dynamic> toJson() => {
        "totalSales": totalSales,
    };
}
