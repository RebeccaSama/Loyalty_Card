import 'dart:convert';

class RewardModel {
  final String? id;
  final String name;
  final String? description;
  final int pointsRequired;
  final int? stock;
  final String? imageUrl;
  final bool? isActive;
  RewardModel({
    this.id,
    required this.name,
    this.description,
    required this.pointsRequired,
    this.stock,
    this.imageUrl,
    this.isActive,
  });

  RewardModel copyWith({
    String? id,
    String? name,
    String? description,
    int? pointsRequired,
    int? stock,
    String? imageUrl,
    bool? isActive,
  }) {
    return RewardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pointsRequired: pointsRequired ?? this.pointsRequired,
      stock: stock ?? this.stock,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'pointsRequired': pointsRequired,
      'stock': stock,
      'imageUrl': imageUrl,
      'isActive': isActive,
    };
  }

  factory RewardModel.fromMap(Map<String, dynamic> map) {
    return RewardModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      pointsRequired: map['pointsRequired'] as int,
      stock: map['stock'] != null ? map['stock'] as int : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RewardModel.fromJson(String source) => RewardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RewardModel(id: $id, name: $name, description: $description, pointsRequired: $pointsRequired, stock: $stock, imageUrl: $imageUrl, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant RewardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.pointsRequired == pointsRequired &&
      other.stock == stock &&
      other.imageUrl == imageUrl &&
      other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      pointsRequired.hashCode ^
      stock.hashCode ^
      imageUrl.hashCode ^
      isActive.hashCode;
  }
}
