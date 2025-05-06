// offer_model.dart
class Offer {
  final String id;
  final String title;
  final String description;
  final int discount;
  final DateTime startDate;
  final DateTime endDate;
  final String targetAudience;
  final bool isActive;
  final int v;

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.startDate,
    required this.endDate,
    required this.targetAudience,
    required this.isActive,
    required this.v,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      discount: json['discount'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      targetAudience: json['targetAudience'],
      isActive: json['isActive'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'discount': discount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'targetAudience': targetAudience,
      'isActive': isActive,
    };
  }
}
