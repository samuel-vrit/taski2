import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/constants/app_constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? email;
  String? name;

  String? password;
  String? password2;

  bool hidePassword = true;
  bool hidePassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up', style: kHeadingTextStyle1)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(height: 10),
              //Image
              Image.asset(
                "assets/app_logo.png",
                fit: BoxFit.contain,
                width: double.infinity,
                height: 100,
              ),
              SizedBox(height: 27),
              //welcome back
              Text(
                "Welcome  👋",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              //today is new day
              Text("Please enter your details to continue"),
              SizedBox(height: 20),
              Text('Name'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your name",
                  hintStyle: TextStyle(color: Color(0XFF8897AD)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                  ),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 20),
              Text('Email'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your email",
                  hintStyle: TextStyle(color: Color(0XFF8897AD)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                  ),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 20),
              Text('Password'),
              SizedBox(height: 5),
              TextField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      hidePassword = !hidePassword;
                      setState(() {});
                    },
                    child: hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  hintText: "Please enter your password",
                  hintStyle: TextStyle(color: Color(0XFF8897AD)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 20),
              Text('Confirm Password'),
              SizedBox(height: 5),
              TextField(
                obscureText: hidePassword2,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      hidePassword2 = !hidePassword2;
                      setState(() {});
                    },
                    child: hidePassword2
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  hintText: "Confirm your password",
                  hintStyle: TextStyle(color: Color(0XFF8897AD)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFFD4D7E3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0XFF1D4AE9)),
                  ),
                ),
                onChanged: (value) {
                  password2 = value;
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (name == null) {
                    Fluttertoast.showToast(
                      msg: 'Please enter your name',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                  if (name!.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Please enter your name',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                  if (email == null) {
                    Fluttertoast.showToast(
                      msg: 'Please enter your email',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                  if (email!.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Please enter your email',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                  if (password == null) {
                    Fluttertoast.showToast(
                      msg: 'Please enter the password',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                  if (password!.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Please enter the password',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }

                  if (!(password == password2)) {
                    Fluttertoast.showToast(
                      msg: 'Passwords must be same',
                      backgroundColor: Colors.red,
                    );
                    return;
                  }
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFF162D3A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: kBodyTextStyle),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: kBodyTextStyle.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
