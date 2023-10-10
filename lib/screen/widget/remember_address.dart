import 'package:flutter/material.dart';

class RememberAddress extends StatefulWidget {
  const RememberAddress({super.key});

  @override
  State<RememberAddress> createState() => _RememberAddressState();
}

class _RememberAddressState extends State<RememberAddress> {
  String? _chosenValue; // Declare _chosenValue as a variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,right:15,left: 15),
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Android',
                'IOS',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: Text(
                "Please choose a language",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onChanged: (String? value) {
                // Update the value when the dropdown selection changes
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
