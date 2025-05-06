class Gallery {
  String thumb;
  String id;

  Gallery({
    required this.thumb,
    required this.id,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        thumb: json["thumb"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "_id": id,
      };
}
