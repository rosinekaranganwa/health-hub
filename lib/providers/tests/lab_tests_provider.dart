import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/constant/api_constant.dart';
import 'package:health_hub/models/tests/lab_tests_model.dart';

class GetLabTestProvider with ChangeNotifier{
  List<LabTest> _labTests=[];
  final Dio _dio = Dio();

  List<LabTest> get labTests => _labTests;

  Future<List<LabTest>> fetchLabTests() async {
    debugPrint("In request");
    try {
      final response = await _dio.get(
        '${apiBaseUrl}/api/labTests/',
        options: Options(
          headers: {
            'Authorization': 'Bearer ',
          },
        ),
      );
      print('Response received: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data;
        if (dataList != null) {
          _labTests = dataList.map((item) => LabTest.fromJson(item)).toList();
          notifyListeners();
        } else {
          debugPrint('Response data is null.');
        }
      } else {
        debugPrint('Error fetching lab tests. Status code: ${response.statusCode}');
        debugPrint('Response data: ${response.data}');
      }
    } on DioError catch (error) {
      debugPrint('DioError: $error');
    } catch (e) {
      debugPrint("Error: $e");
    }
    return _labTests;
  }


}


