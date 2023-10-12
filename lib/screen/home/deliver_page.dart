import 'package:flutter/material.dart';

class DeliverPage extends StatefulWidget {
  const DeliverPage({Key? key});

  @override
  State<DeliverPage> createState() => _DeliverPageState();
}

class _DeliverPageState extends State<DeliverPage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EFE7),
      appBar: AppBar(
        title: ListTile(
          title: Text("Deliver To:", style: TextStyle(color: Colors.white)),
          subtitle: Text("KG219 St, Kigali", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color(0xFF0492C2),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          // Add your pages here
          Center(child: Text("Store Front Page")),
          Center(child: Text("Search Page")),
          Center(child: Text("Orders Page")),
          Center(child: Text("Cart Page")),
          Center(child: Text("More Page")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        selectedItemColor: Color(0xFF0492C2),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.storage), label: "Store Front"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "More"),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
