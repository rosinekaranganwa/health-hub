import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EFE7),
      appBar: AppBar(
        title: Text("Search", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0492C2),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "Search from:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected1 = true;
                      isSelected2 = false;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isSelected1 ? Colors.blue : Color(0xFFF0EFE7),
                      borderRadius: BorderRadius.circular(5),
                      border: !isSelected1
                          ? Border.all(
                        color: Colors.blue, // Border color for unselected
                        width: 2, // Border width
                      )
                          : null, // Null border when selected
                    ),
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(
                          color: isSelected1 ? Colors.white : Colors.blueGrey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected1 = false;
                      isSelected2 = true;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isSelected2 ? Colors.blue : Color(0xFFF0EFE7),
                      borderRadius: BorderRadius.circular(5),
                      border: !isSelected2
                          ? Border.all(
                        color: Colors.blue, // Border color for unselected
                        width: 2, // Border width
                      )
                          : null, // Null border when selected
                    ),
                    child: Center(
                      child: Text(
                        "Lab Tests",
                        style: TextStyle(
                          color: isSelected2 ? Colors.white : Colors.blueGrey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
