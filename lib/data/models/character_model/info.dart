class InfoChar {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  InfoChar({this.count, this.pages, this.next, this.prev});

  factory InfoChar.fromJson(Map<String, dynamic> json) => InfoChar(
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
