import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EFE7),
      appBar: AppBar(
        title: Center(child: Text("Options", style: TextStyle(color: Colors.white))),
        backgroundColor: Color(0xFF0492C2),
      ),
      body: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        "All",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        "Lab Tests",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        "Lab Tests",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
