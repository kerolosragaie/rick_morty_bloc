import 'info.dart';
import 'result.dart';

class CharacterModel {
  Info? info;
  List<Result>? results;

  CharacterModel({this.info, this.results});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'info': info?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
      };
}