import 'dart:async';

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  late AnimationController controller;
  final AcrCloudSdk arc = AcrCloudSdk();

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
          host: 'identify-eu-west-1.acrcloud.com',
          accessKey: '92e5456a723332fd090e3ab70ece161e',
          accessSecret: 'orZqaXs6DkJglYXeypJC0YCh0a4LEjOoMdl8gNTJ',
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

  void searchSong(SongModel song) async {}
}
