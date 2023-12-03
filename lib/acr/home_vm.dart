import 'dart:async';

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:tune_finder/acr/song_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tune_finder/acr/song.dart';

class HomeViewModel extends ChangeNotifier {
  late AnimationController controller;
  final AcrCloudSdk arc = AcrCloudSdk();
  final SongAPI api = SongAPI();

  BuildContext? _context;

  SongModel? _songModel;
  SongModel? get songModel => _songModel;
  set songModel(SongModel? val) {
    _songModel = val;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> init(BuildContext context) async {
    try {
      _context = context;

      arc
        ..init(
          host: 'identify-ap-southeast-1.acrcloud.com',
          accessKey: '87c519ea08b06de3997d1ddb815050d2',
          accessSecret: 'bq6JwzBSMbG1TOOZNO8J9s6gPSdk0faseQinGZ8E',
          setLog: false,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void start() async {
    try {
      controller.repeat();
      loading = true;
      await arc.start();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void stop() async {
    try {
      controller.stop();
      loading = false;
      await arc.stop();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void searchSong(SongModel song) async {
    var data = song.metadata;

    if (data != null && data.music!.isNotEmpty) {
      var req = await api
          .dataFromDeezer(data.music?[0].externalMetadata?.deezer?.track?.id);
      // ignore: avoid_print
      req.fold((l) => print(l.toString()), (songModel) {
        showCupertinoModalBottomSheet(
            context: _context!,
            builder: (_) {
              return SongDetailPage(songModel);
            });
      });
    }
    controller.stop();
    loading = false;
  }
}
