class Result {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  DateTime? created;

  Result({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        dimension: json['dimension'] as String?,
        residents: json['residents'] as List<String>?,
        url: json['url'] as String?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'dimension': dimension,
        'residents': residents,
        'url': url,
        'created': created?.toIso8601String(),
      };
}
