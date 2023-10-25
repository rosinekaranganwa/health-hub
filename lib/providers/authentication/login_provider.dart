import 'package:dio/dio.dart';
import 'package:health_hub/models/app/my_response.dart';
import 'package:health_hub/models/authentication/login_model.dart';
import 'package:flutter/material.dart';
import '../../constant/api_constant.dart';
import '../prefs/preferences.dart';

class LoginProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final PreferencesProvider prefProvider;

  set preferencesProvider(PreferencesProvider? provider) {
    preferencesProvider = provider;
    notifyListeners();
  }
  LoginProvider(this.prefProvider) {
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.followRedirects = true;
  }

  Future<MyResponse> login(LoginModel data) async
  {
    try {
      var response = await _dio.post(
        '${apiBaseUrl}auth/login/',
        data: {
          "phone_number": data.phone_number,
          "password": data.password,
        },
      );
      print('Stored token: ${response.data}');
      final token = response.data['data']['token'] as String;
      await prefProvider.setToken(token);
      print('Stored token: $token');
      var myResponse=MyResponse.fromJson(response.data,statusCode: response.statusCode??1,success: true);
      return myResponse;
    }on DioError catch (e) {
      print('Login error: ${e.response?.data}');
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



  Future<void> logout() async {

    await prefProvider.clearToken();
    notifyListeners();
  }

  bool isLoggedIn() {
    final token = prefProvider.getToken();
    return token != null;
  }
}

