import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
          // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextField(
                autofocus: true,
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(0, 13, 21, 2),
                  suffixIcon: InkWell(
                    onTap: () {
                      _controller.clear();
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  hintText: "Search for songs, artists and lyrics",
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Image.asset(
                "assets/images/shazam-logo.png",
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Search for songs, artists or lyrics that interest you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
