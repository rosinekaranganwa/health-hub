import 'package:flutter/material.dart';
import 'package:health_hub/providers/tests/lab_tests_provider.dart';
import 'package:health_hub/models/tests/lab_tests_model.dart';
import 'package:provider/provider.dart';

class Store extends StatefulWidget {
  const Store({Key? key});

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getLabTestProviders = Provider.of<GetLabTestProvider?>(context, listen: true);

    return FutureBuilder<List<LabTest>>(
      future: getLabTestProviders?.fetchLabTests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Text('No lab tests available.');
        } else {
          final labTests = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: .58,
            ),
            itemCount: labTests?.length,
            itemBuilder: (context, index) {
              var labTest = labTests?[index];
              return GestureDetector(
                onTap: () {
                  // Handle tap event
                },
                child: Card(
                  elevation: 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          labTest!.image,
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
                ),
              );
            },
          );
        }
      },
    );
  }
}
