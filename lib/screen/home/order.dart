import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Specify the number of tabs
      child: Scaffold(
        backgroundColor: Color(0xFFF0EFE7),
        appBar: AppBar(
          title: Center(child: Text("Order History", style: TextStyle(color: Colors.white))),
          backgroundColor: Color(0xFF0492C2),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Processing"),
              Tab(text: "Completed"),
              Tab(text: "Failed"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("Processing Screen"),
            ),
            Center(
              child: Text("Completed Screen"),
            ),
            Center(
              child: Text("Failed Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
