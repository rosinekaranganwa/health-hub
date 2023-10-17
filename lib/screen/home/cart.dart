import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EFE7),
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0492C2),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Text("Your cart is empty"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Start Shoping',style: TextStyle(
                color: Color(0xFF0492C2)
              ),),
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith<BorderSide>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return BorderSide(color: Color(0xFF0492C2));
                    }
                    return BorderSide(color: Color(0xFF0492C2));
                  },
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
