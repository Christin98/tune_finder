import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tune_finder/playsong.dart';
import 'package:tune_finder/songinfo.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
        title: const Text("Shazam"),
        actions: const [
          Icon(
            Icons.playlist_add_check,
            size: 27,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 300,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "STEAL THEM ALL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 15,
                  child: const Text(
                    "YESTERDAY",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 15,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 15,
                  child: const Text(
                    "THURSDAY",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 15,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 15,
                  child: const Text(
                    "MONDAY",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 15,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 15,
                  child: const Text(
                    "LAST WEEK",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 15,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 15,
                  child: const Text(
                    "OCTOBER 2021",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 15,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 170,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Songinfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/todd.jpg",
                                fit: BoxFit.cover,
                                height: 175,
                              ),
                              Positioned(
                                top: 40,
                                left: 45,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 210,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Witt Lowry Feat. Avax",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "29 Eki. 00:53",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(40, 49, 54, 1),
                                        borderRadius: BorderRadius.circular(10),
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
                                    InkWell(
                                      onTap: () {
                                        showmodal();
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
