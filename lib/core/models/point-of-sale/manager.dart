// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Manager {
   String id;
  String email;
  Manager({
    required this.id,
    required this.email,
  });

  Manager copyWith({
    String? id,
    String? email,
  }) {
    return Manager(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }

  factory Manager.fromMap(Map<String, dynamic> map) {
    return Manager(
      id: map['_id'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Manager.fromJson(String source) => Manager.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Manager(id: $id, email: $email)';

  @override
  bool operator ==(covariant Manager other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}
