import 'package:flutter/material.dart';
import 'package:tune_finder/acr/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tune_finder/acr/providers.dart';

class Listening extends StatefulHookWidget {
  const Listening({super.key});

  @override
  _ListeningState createState() => _ListeningState();
}

class _ListeningState extends State<Listening> {
  @override
  Widget build(BuildContext context) {
    final loading = useProvider(homeVM.select((v) => v.loading));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(
              context,
            );
          },
          child: const Icon(
            Icons.close,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: InkWell(
        onTap: () {
          if (!loading) {
            if (kDebugMode) {
              print("started");
            }
            context.read(homeVM).start();
          } else {
            if (kDebugMode) {
              print("finished");
            }
            context.read(homeVM).stop();
          }
        },
        child: Ripples(
          color: Colors.blueGrey,
          size: loading ? 180 : 100,
          child: Container(
            color: Colors.transparent,
            width: 160,
            height: 160,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/shazam-logo.png",
                color: Colors.white,
                //height: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
