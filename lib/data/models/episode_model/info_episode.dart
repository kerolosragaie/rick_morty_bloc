class InfoEpisode {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  InfoEpisode({this.count, this.pages, this.next, this.prev});

  factory InfoEpisode.fromJson(Map<String, dynamic> json) => InfoEpisode(
        count: json['count'] as int?,
        pages: json['pages'] as int?,
        next: json['next'] as String?,
        prev: json['prev'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'pages': pages,
        'next': next,
        'prev': prev,
      };
}
