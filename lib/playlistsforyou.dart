import 'package:flutter/material.dart';
import 'package:tune_finder/playsong.dart';

class PlaylistsForYou extends StatefulWidget {
  const PlaylistsForYou({super.key});

  @override
  _PlaylistsForYouState createState() => _PlaylistsForYouState();
}

class _PlaylistsForYouState extends State<PlaylistsForYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
        title: const Text("Senin için Çalma Listeleri"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
                indent: 150,
                endIndent: 20,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Playsong(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.red,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.blue,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.orange,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Container(
                                          color: Colors.purple,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 35,
                                left: 35,
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 231,
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Into Your Arms",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Ve Benzer Şarkılar",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
