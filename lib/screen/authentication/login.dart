import 'package:flutter/material.dart';
import 'package:health_hub/screen/authentication/sign_up.dart';
import 'package:health_hub/screen/home/deliver_page.dart';
import 'package:provider/provider.dart';

import '../../models/authentication/login_model.dart';
import '../../providers/authentication/login_provider.dart';
import '../../providers/prefs/preferences.dart';
import '../home_page.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Color myColor;
  late Size mediaSize;
  bool _showPassword = false;
  bool isLoading=false;
  final _formKey=GlobalKey<FormState>();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool rememberUser=false;
  String? _phoneNumberError;
  String? _passwordError;
  String? storedToken;
  bool loginFailed = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPrefs();
    });
    super.initState();
  }

  initPrefs() async {
    var preferenceProvider = Provider.of<PreferencesProvider>(context, listen: false);
    await preferenceProvider.init();
    var token = preferenceProvider.getToken();
    if (token != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }


  loginButton() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      final loginData = LoginModel(
        phone_number: phoneNumberController.text,
        password: passwordController.text,
      );

      var response = await loginProvider.login(loginData);
      if (response.success) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Login Error'),
              content: Text(response.message),
              actions: [
                ElevatedButton(
                    onPressed:(){
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            ));
        // showSnackbar(context, response.message);
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    myColor=Theme.of(context).primaryColor;
    mediaSize=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0492C2,),
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top:20,child: _buildTop(),),
            Positioned(bottom: 0,child: _buildBottom(),),
          ],
        ),
      ),
    );
  }
  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.health_and_safety_outlined,
            size: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }
  Widget _buildForm(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Login Here",
            style:TextStyle(
              color: Color(0xFF0492C2,
              ),
              fontSize: 32,
              fontWeight: FontWeight.w500
            ) ,),
          Text("Please Login with your information",
            style: TextStyle(
              color: Colors.grey
            ),),
          SizedBox(height: 40,),
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _phoneNumberError = null;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _passwordError = null;
              });
            },
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: rememberUser,
                      onChanged: (value){
                        setState(() {
                          rememberUser=value!;
                        });
                      }),
                  Text("Remember me"),
                ],
              ),
              TextButton(
                  onPressed: (){},
                  child: Text("I forgot my password",
                    style: TextStyle(
                      color: Color(0xFF0492C2)
                    ),))
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: isLoading ? null : loginButton,
            child: isLoading
                ?CircularProgressIndicator()
                :Text("LOGIN",
              style: TextStyle(color: Color(0xFF0492C2)),),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                elevation: 20,
                shadowColor: Color(0xFF0492C2),
                minimumSize: Size.fromHeight(60),
              ),
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              Text('Or Login With',style: TextStyle(color: Color(0xFF0492C2)),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tab(icon: Image.asset("assets/images/facebook.png"),),
                  Tab(icon: Image.asset("assets/images/twitter.png"),),
                  Tab(icon: Image.asset("assets/images/github.png"),)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                      child: Text("Sign Up",
                        style: TextStyle(
                            color: Color(0xFF0492C2)
                        ),))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


