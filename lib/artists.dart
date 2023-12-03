import 'package:flutter/material.dart';
import 'package:tune_finder/onlyartists.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
        title: const Text("Artists"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
                                        ),
                                      ),
                                    ],
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
                                builder: (context) => Onlyartists(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              color: const Color.fromRGBO(18, 31, 37, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 175,
                            height: 275,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    //color: Color.fromRGBO(18, 31, 37, 1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 275,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          "assets/images/todd.jpg",
                                          fit: BoxFit.cover,
                                          height: 275,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 245,
                                        left: 10,
                                        child: Text(
                                          "Witt Lowry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 220,
                                        left: 125,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.black.withOpacity(0.7),
                                          size: 50,
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
}
