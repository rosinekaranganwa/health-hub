import 'package:flutter/material.dart';
import 'package:health_hub/providers/tests/lab_tests_provider.dart';
import 'package:provider/provider.dart';

import '../../models/tests/lab_tests_model.dart';

class Store extends StatefulWidget {
  const Store({Key? key});

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetLabTestProvider>(context, listen: false).getAllLabTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetLabTestProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final labTests = value.labTests;

          if (labTests.isEmpty) {
            return Center(child: Text('No lab tests available.'));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
            ),
            itemCount: labTests.length,
            itemBuilder: (context, index) {
              final labTest = labTests[index];
              return buildLabTestCard(labTest);
            },
          );
        },
      ),
    );
  }

  Widget buildLabTestCard(LabTest labTest) {
    return Card(
      elevation: 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              labTest.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 4.0,
              top: 4.0,
              bottom: 4.0,
            ),
            child: Text(
              labTest.name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              Flexible(
                child: Text(
                  labTest.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}




// body: Consumer<GetLabTestProvider>(
//   builder: (context, labTestProvider, child) {
//     return FutureBuilder<List<LabTest>>(
//       future: labTestProvider.getAllLabTests(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           final labTests = snapshot.data;
//           if (labTests == null || labTests.isEmpty) {
//             return Center(child: Text('No lab tests available.'));
//           }
//           return ListView.builder(
//             itemCount: labTests.length,
//             itemBuilder: (context, index) {
//               final labTest = labTests[index];
//               return GestureDetector(
//                 onTap: () {
//                   // Handle tap event
//                 },
//                 child: Card(
//                   elevation: 0.1,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Image.network(
//                           labTest.image,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 12.0,
//                           right: 4.0,
//                           top: 4.0,
//                           bottom: 4.0,
//                         ),
//                         child: Text(
//                           labTest.name,
//                           style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on),
//                           Flexible(
//                             child: Text(
//                               labTest.description,
//                               style: TextStyle(
//                                 color: Theme.of(context).colorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   },
// ),