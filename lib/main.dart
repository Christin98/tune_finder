import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share/share.dart';
import 'package:tune_finder/acr/home_page.dart';
import 'package:tune_finder/acr/log.dart';
import 'package:tune_finder/acr/providers.dart';
import 'package:tune_finder/all.dart';
import 'package:tune_finder/artists.dart';
import 'package:tune_finder/internet.dart';
import 'package:tune_finder/playlists.dart';
import 'package:tune_finder/playlistsforyou.dart';
import 'package:tune_finder/search.dart';
import 'package:tune_finder/settings.dart';
import 'package:tune_finder/songinfo.dart';

void main() {
  Log.init(kReleaseMode);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tune Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulHookWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController? controller = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
    context.read(homeVM).init(context);
    context.read(homeVM).controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loading = useProvider(homeVM.select((v) => v.loading));

    var screenwidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
        body: SafeArea(
          child: PageView(
            controller: controller,
            children: [
              left(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print("Left");
                            }
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.manage_accounts,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "Library",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print("Right");
                            }
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.trending_up,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "Lists",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 75),
                    Container(
                      color: Colors.transparent,
                      width: screenwidth,
                      height: 75,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText("Tap to Shazam"),
                            RotateAnimatedText(
                                "Long press for automatic Shazam"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        if (!loading) {
                          context.read(homeVM).start();
                        } else {
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 75),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          shape: BoxShape.circle,
                        ),
                        width: 50,
                        height: 50,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              right(),
            ],
          ),
        ),
      ),
    );
  }

  Widget left() {
    showmodal() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            color: const Color.fromRGBO(30, 44, 47, 1),
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                              "assets/images/shazam-logo.png",
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Into Your Arms",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Witt Lowry Feat. Ava Max",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 5,
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            "assets/images/spotify.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Open on Spotify",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (Platform.isIOS)
                  Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/images/apple-music.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "Open in Apple Music",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 50,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Remove from Your Library",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Share.share("null");
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 50,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "View artist",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: const Color.fromRGBO(30, 44, 47, 1),
                        title: const Text(
                          "Wrong song?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        content: const Text(
                          "You can help us get better results by reporting misidentified songs to Shazam",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text(
                              "REPORT",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flag,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Wrong song? Report to Shazam",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 4,
                ),
              ],
            ),
          );
        },
      );
    }

    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Settings(),
              ),
            );
          },
          child: const Icon(
            Icons.settings,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Library",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                width: screenwidth,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const All(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              width: 30,
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/shazam-logo.png",
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              "Shazam",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "195",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 45,
                      thickness: 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Artists(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 30,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Artists",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 45,
                      thickness: 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlaylistsForYou(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child: Row(
                          children: [
                            Icon(
                              Icons.music_note,
                              color: Colors.grey,
                              size: 30,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Playlists for you",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Latest Shazams",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.transparent,
                width: screenwidth,
                //height: 800,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Songinfo(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 175,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 175,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            showmodal();
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 55,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "La La La",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Naughty Boy Feat. Samuel",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                40, 49, 54, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 65,
                                          height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/spotify.png",
                                                  fit: BoxFit.contain,
                                                  height: 175,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Spotify",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Songinfo(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 175,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 175,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            showmodal();
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 55,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "La La La",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Naughty Boy Feat. Samuel",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                40, 49, 54, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 65,
                                          height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/spotify.png",
                                                  fit: BoxFit.contain,
                                                  height: 175,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Spotify",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Songinfo(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 175,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 175,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            showmodal();
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 55,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "La La La",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Naughty Boy Feat. Samuel",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                40, 49, 54, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 65,
                                          height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/spotify.png",
                                                  fit: BoxFit.contain,
                                                  height: 175,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Spotify",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Songinfo(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 175,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 175,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            showmodal();
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 55,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "La La La",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Naughty Boy Feat. Samuel",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                40, 49, 54, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 65,
                                          height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/spotify.png",
                                                  fit: BoxFit.contain,
                                                  height: 175,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Spotify",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Songinfo(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 175,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 175,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            showmodal();
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 55,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "La La La",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Naughty Boy Feat. Samuel",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                40, 49, 54, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 65,
                                          height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/spotify.png",
                                                  fit: BoxFit.contain,
                                                  height: 175,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Spotify",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Songinfo(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 175,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 175,
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            showmodal();
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 55,
                                        left: 55,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "La La La",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Naughty Boy Feat. Samuel",
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                40, 49, 54, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 65,
                                          height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/spotify.png",
                                                  fit: BoxFit.contain,
                                                  height: 175,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Spotify",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const All(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 300,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "SEE ALL",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        const Text(
                          "LAST SYNC",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "30 OCTOBER 2023",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget right() {
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(24, 37, 43, 1),
        centerTitle: true,
        title: const Text(
          "Lists",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(13, 27, 30, 1),
                image: DecorationImage(
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/world.png",
                  ),
                ),
              ),
              width: screenwidth,
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 40,
                    child: InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print("here");
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Internet(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        width: 310,
                        height: 50,
                        child: const Center(
                          child: Text(
                            "COUNTRY AND CITY LISTS",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 140,
                    left: 85,
                    child: Text(
                      "FROM ALL AROUND THE WORLD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromRGBO(34, 48, 51, 1),
              thickness: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                color: Colors.transparent,
                width: screenwidth,
                //height: 500,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: screenwidth,
                      //height: 150,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Playlists(),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Desi List",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "SEE ALL",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Color.fromRGBO(34, 48, 51, 1),
              thickness: 15,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                color: Colors.transparent,
                width: screenwidth,
                //height: 500,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: screenwidth,
                      //height: 150,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Playlists(),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discover: Desi",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "SEE ALL",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Color.fromRGBO(34, 48, 51, 1),
              thickness: 15,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                color: Colors.transparent,
                width: screenwidth,
                //height: 500,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: screenwidth,
                      //height: 150,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Playlists(),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "World List",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "SEE ALL",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Songinfo(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 115,
                                  height: 195,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 120,
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        color: Colors.transparent,
                                        width: 120,
                                        height: 65,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Chaleya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Jawan",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
