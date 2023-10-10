import 'package:flutter/material.dart';
import 'package:health_hub/screen/widget/remember_address.dart';

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
                    borderRadius: BorderRadius.circular(5)
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      text: 'Remember',
                    ),
                    Tab(
                      text: 'Always Ask',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            RememberAddress(),
            Text("Always ask")
          ],
        ),
      ),
    );
  }
}
