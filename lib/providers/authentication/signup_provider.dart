import 'package:dio/dio.dart';
import 'package:health_hub/models/authentication/signup_model.dart';
import 'package:flutter/material.dart';
import '../../constant/api_constant.dart';
import '../../models/app/my_response.dart';


class SignUpProvider extends ChangeNotifier {
  final Dio _dio = Dio();

  SignUpProvider() {
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.followRedirects = true;
  }

  Future<MyResponse> signup(SignUpModel data) async {
    try {
      final response = await _dio.post(
        '${apiBaseUrl}auth/register',
        data: {
          "phone_number": data.phone_number,
          "email": data.email,
          "password": data.password,
          "confirm_password": data.confirm_password,
        },
      );

      var myResponse=MyResponse.fromJson(response.data,statusCode: response.statusCode??1,success: true);
      return myResponse;
    }on DioError catch (e) {
      print('Sign up error: ${e.response?.data}');
      var myResponse=MyResponse.fromJson(e.response?.data??{},statusCode: e.response?.statusCode??1,success: false);
      if(myResponse.message==""){
        myResponse.message=e.response?.statusMessage??"";
      }

      return myResponse;
    } catch (e) {
      print(e);
      return MyResponse(message: "There is a system error",statusCode: 500,success: false);
    }
  }
}


