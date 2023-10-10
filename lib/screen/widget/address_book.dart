import 'package:flutter/material.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({super.key});

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  bool isSelected1 = false;
  bool isSelected2 = false;
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
              SizedBox(height: 30,),
              ListTile(
                title: Text("Address Usage Option:",style: TextStyle(fontSize: 14),),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected1 = true;
                          isSelected2 = false;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isSelected1 ? Colors.blue :  Color(0xFFF0EFE7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Find Address",
                            style: TextStyle(
                              color: isSelected1 ? Colors.white : Color(0xFF0492C2),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected1 = false;
                          isSelected2 = true;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isSelected2 ? Colors.blue : Color(0xFFF0EFE7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Current Location",
                            style: TextStyle(
                              color: isSelected2 ? Colors.white : Color(0xFF0492C2),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}


