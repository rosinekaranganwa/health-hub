import 'package:flutter/material.dart';
import 'package:health_hub/screen/authentication/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late Color myColor;
  late Size mediaSize;
  bool _showPassword = false;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool rememberUser=false;

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
    return Column(
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
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Phone',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
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
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: passwordController,
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
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          onPressed: (){
            debugPrint("Email : ${emailController.text}");
            debugPrint("Password : ${passwordController.text}");
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            elevation: 20,
            shadowColor: Color(0xFF0492C2),
            minimumSize: Size.fromHeight(60),
          ),
          child: Text("SIGNUP",
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
    );
  }
}