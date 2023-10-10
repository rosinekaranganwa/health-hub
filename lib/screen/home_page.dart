import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0492C2),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Delivery Location",style: TextStyle(color: Colors.white),),
            Row(
              children: [
                Icon(Icons.logout_outlined,color: Colors.white,),
                Text("Logout",style: TextStyle(color: Colors.white),)
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("We request location details in advance to provide clear information about delivery charges prior to choosing a vendor",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),),
          ),
          
        ],
      ),
    );
  }
}


