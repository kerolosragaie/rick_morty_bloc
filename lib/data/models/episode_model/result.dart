class Result {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;

  Result({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        name: json['name'] as String?,
        airDate: json['air_date'] as String?,
        episode: json['episode'] as String?,
        characters: json['characters'] as List<String>?,
        url: json['url'] as String?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'air_date': airDate,
        'episode': episode,
        'characters': characters,
        'url': url,
        'created': created?.toIso8601String(),
      };
}
