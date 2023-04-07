import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty_bloc/data/models/episode_model/result_episode.dart';
import '../../core/errors/exception.dart';
import 'package:debug_logger/debug_logger.dart';

abstract class EposidesRemoteDataSource {
  Future<List<ResultEpisode>> getAllEposides(List<String> eposides);
}

class EposidesRemoteDataSourceImpl implements EposidesRemoteDataSource {
  final http.Client client;
  EposidesRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ResultEpisode>> getAllEposides(List<String> eposides) async {
    List<ResultEpisode> allEpisodes = [];
    for (int i = 0; i < eposides.length; i++) {
      final response = await client.get(Uri.parse(eposides[i]));
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        final ResultEpisode result = ResultEpisode.fromJson(decodedJson);
        allEpisodes.add(result);
      } else {
        throw ServerException();
      }
    }
    return allEpisodes;
  }
}
