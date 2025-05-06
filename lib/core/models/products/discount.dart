class Discount {
  int percentage;
  DateTime expireDate;
  bool isActive;

  Discount({
    required this.percentage,
    required this.expireDate,
    required this.isActive,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        percentage: json["percentage"],
        expireDate: DateTime.parse(json["expireDate"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "expireDate": expireDate.toIso8601String(),
        "isActive": isActive,
      };
}
