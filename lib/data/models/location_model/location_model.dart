import 'info.dart';
import 'result_location.dart';

class LocationModel {
  Info? info;
  List<ResultLocation>? results;

  LocationModel({this.info, this.results});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        info: json['info'] == null
            ? null
            : Info.fromJson(json['info'] as Map<String, dynamic>),
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => ResultLocation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'info': info?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
