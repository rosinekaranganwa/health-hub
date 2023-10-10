import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xFF0492C2),
                  indicator: BoxDecoration(
                    color: Color(0xFF0492C2),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      text: 'Basic',
                    ),
                    Tab(
                      text: 'Advanced',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Text('Remember'),
            Text("Always ask")
          ],
        ),
      ),
    );
  }
}
