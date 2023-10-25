import 'package:flutter/material.dart';
import 'package:health_hub/screen/authentication/login.dart';
import 'package:provider/provider.dart';

import '../../models/authentication/signup_model.dart';
import '../../providers/authentication/signup_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late Color myColor;
  late Size mediaSize;
  bool isLoading=false;
  final _formKey=GlobalKey<FormState>();
  bool _showPassword = false;
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  bool rememberUser=false;

  signUpButton() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final signUpProvider = Provider.of<SignUpProvider>(
          context, listen: false);
      if (passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty && phoneNumberController.text.isNotEmpty ) {
        final data = SignUpModel(
          phone_number: phoneNumberController.text,
          email: emailController.text.isEmpty?null:emailController.text,
          password: passwordController.text,
          confirm_password: confirmPasswordController.text,
        );
        var response = await signUpProvider.signup(data);
        if (response.success) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
        // }
        // else {
        //   showSnackbar(context, response.message);
        // }
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
          Text("SignUp Here",
            style:TextStyle(
                color: Color(0xFF0492C2,
                ),
                fontSize: 32,
                fontWeight: FontWeight.w500
            ) ,),
          Text("Please SignUp with your information",
            style: TextStyle(
                color: Colors.grey
            ),),
          SizedBox(height: 40,),
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              hintText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
            ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                  }
                return null;
                },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter again your password';
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: isLoading ? null :signUpButton,
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              elevation: 20,
              shadowColor: Color(0xFF0492C2),
              minimumSize: Size.fromHeight(60),
            ),
            child: isLoading ? CircularProgressIndicator() :
            Text("SIGNUP",
            style: TextStyle(color: Color(0xFF0492C2)),),


          ),
          SizedBox(height: 20,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> Login()));
                      },
                      child: Text("Login",
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


