import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                child: Text('Manage',style: TextStyle(
                  color: Colors.black,
                ),)),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  backgroundColor: Color(0xFF04BADE),
                ),
                child: Text('Invest',style: TextStyle(
                  color: Colors.white
                ),)),
            Padding(
                padding: EdgeInsets.only(right: 70)),
            Row(
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.notifications)),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.format_align_right))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
