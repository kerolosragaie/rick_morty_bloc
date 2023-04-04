import 'info.dart';
import 'result_char.dart';

class CharacterModel {
  InfoChar? info;
  List<ResultChar>? results;

  CharacterModel({this.info, this.results});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      info: json['info'] == null
          ? null
          : InfoChar.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultChar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'info': info?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
