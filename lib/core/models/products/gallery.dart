// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Gallery {
  String thumb;
  String id;

  Gallery({
    required this.thumb,
    required this.id,
  });

  Gallery copyWith({
    String? thumb,
    String? id,
  }) {
    return Gallery(
      thumb: thumb ?? this.thumb,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumb': thumb,
      'id': id,
    };
  }

  factory Gallery.fromMap(Map<String, dynamic> map) {
    return Gallery(
      thumb: map['thumb'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gallery.fromJson(String source) =>
      Gallery.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Gallery(thumb: $thumb, id: $id)';

  @override
  bool operator ==(covariant Gallery other) {
    if (identical(this, other)) return true;

    return other.thumb == thumb && other.id == id;
  }

  @override
  int get hashCode => thumb.hashCode ^ id.hashCode;
}
