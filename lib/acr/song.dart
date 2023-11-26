import 'dart:convert';

import 'package:tune_finder/acr/deezer_song_model.dart';
import 'package:tune_finder/acr/failure.dart';
import 'package:tune_finder/acr/api_helper.dart';
import 'package:tune_finder/acr/base_repository.dart';

import 'package:dartz/dartz.dart' show Either, Right, Left;

class SongAPI extends BaseRepository {
  final apiHelper = ApiHelper();

  Future<Either<Failure, DeezerSongModel>> dataFromDeezer(String? id) async {
    return _dataFromDeezer(id);
  }

  Future<Either<Failure, DeezerSongModel>> _dataFromDeezer(String? id) async {
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };
      final response = await apiHelper.get(
        url: 'https://api.deezer.com/track/$id',
        headers: headers,
      );

      if (response.contains('title')) {
        return Right(DeezerSongModel.fromJson(json.decode(response)));
      } else {
        return Left(ServerFailure(message: response));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
