import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/constant/api_constant.dart';

import '../../models/tests/lab_tests_model.dart';

class GetLabTestProvider with ChangeNotifier {
  List<LabTest> _labTests = [];
  final Dio _dio = Dio();
  bool isLoading = false;

  List<LabTest> get labTests => _labTests;

  GetLabTestProvider() {
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.followRedirects = true;
  }

  Future<void> getAllLabTest() async {
    isLoading = true;
    try {
      final response = await _dio.get(
        '${apiBaseUrl}/api/labTests/',
        options: Options(
          headers: {
            'Authorization': 'Bearer ',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonData = response.data as List; // Parse directly as a list
        final labTests = jsonData.map((e) {
          return LabTest(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            image: e['image'],
          );
        }).toList();
        _labTests = labTests;
        notifyListeners();
        isLoading = false;
      } else {
        isLoading = false;
        print("Failed to load lab tests: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching lab tests: $error");
      isLoading = false;
    }
  }
}



// Future<List<LabTest>> getAllLabTests() async {
  //   try {
  //     final response = await _dio.get(
  //       '${apiBaseUrl}/api/labTests/',
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ',
  //         },
  //       ),
  //     );
  //     final data = response.data;
  //     print(data);
  //     if (data is Map && data.containsKey('data')) {
  //       final List<dynamic> labTestsData = data['data'];
  //       final List<LabTest> getAllLabTests = [];
  //
  //       for (var labTestMap in labTestsData) {
  //         getAllLabTests.add(LabTest(
  //           id: labTestMap['id'],
  //           name: labTestMap['name'],
  //           description: labTestMap['description'],
  //           image: labTestMap['image'],
  //         ));
  //       }
  //       _labTests = getAllLabTests;
  //       notifyListeners();
  //       return _labTests;
  //     }
  //   } catch (error) {
  //     print("Error fetching lab tests: $error");
  //     throw error; // Rethrow the error so you can catch it in the FutureBuilder
  //   }
  //
  //   return _labTests; // Return an empty list if no data is found
  // }


