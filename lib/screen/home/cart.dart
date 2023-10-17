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
    );
  }
}
