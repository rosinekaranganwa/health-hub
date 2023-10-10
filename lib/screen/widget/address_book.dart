import 'package:flutter/material.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({super.key});

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar:AppBar(
            title: Text("My Address Book", style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF0492C2),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
              },
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text('Addresses',
                    style: TextStyle(color: Colors.white,
                      fontSize: 20,
                    ),)),
                Tab(
                  child: Text('New Address',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    ),),
                ),
              ],
            ),
          )

      ),
    );
  }
}


