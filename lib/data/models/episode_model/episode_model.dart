import 'info.dart';
import 'result_episode.dart';

class EpisodeModel {
  Info? info;
  List<ResultEpisode>? results;

  EpisodeModel({this.info, this.results});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        info: json['info'] == null
            ? null
            : Info.fromJson(json['info'] as Map<String, dynamic>),
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => ResultEpisode.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'info': info?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
