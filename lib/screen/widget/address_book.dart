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
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF0492C2),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                          child: Text("Find Address",style: TextStyle(color: Colors.white,fontSize: 18),)),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF0492C2),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                          child: Text("Current Location",style: TextStyle(color: Colors.white,fontSize: 18),)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 20),
                child: TextFormField(
                  initialValue:'KG 219 Street,Remera,Kigali',
                  // initialValue: 'Delivery Street',
                  decoration: InputDecoration(
                    labelText: 'Delivery Street',
                    // labelText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 20),
                child: TextFormField(
                  initialValue:'KG 219 Street',
                  // initialValue: 'Delivery Street',
                  decoration: InputDecoration(
                    labelText: 'Area Name',
                    // labelText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 20),
                child: TextFormField(
                  initialValue:'0780022601',
                  // initialValue: 'Delivery Street',
                  decoration: InputDecoration(
                    labelText: 'Local Contact Number',
                    // labelText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'House Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}


