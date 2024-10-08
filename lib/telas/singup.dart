import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String fullName;
  final String emailOrNumber;
  final String password;

  User({required this.fullName, required this.emailOrNumber, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'emailOrNumber': emailOrNumber,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      emailOrNumber: json['emailOrNumber'],
      password: json['password'],
    );
  }
}
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailOrNumberController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _saveUser() async{

    if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Senhas diferentes!'),
            backgroundColor: Colors.red, 
          ),
        );
        return; 
    }
    
    User user = User(
    fullName: nameController.text,
    emailOrNumber: emailOrNumberController.text,
    password: passwordController.text,
  );

  String userJson = jsonEncode(user.toJson());

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', userJson);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Cadastro salvo com sucesso!')),
  );

  print(userJson);
  }
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Account",
            style: TextStyle(color: Color.fromRGBO(226, 241, 99, 1))),
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        leading:  IconButton(
            icon: Transform.rotate(
            angle: 3.14, 
            child: Icon(Icons.play_arrow), 
          ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Color.fromRGBO(226, 241, 99, 1),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Let´s Start!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Color.fromRGBO(179, 160, 255, 1), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full name",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                  CupertinoTextField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "Fulano de Souza",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email or Mobile Number",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                  CupertinoTextField(
                    controller: emailOrNumberController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "example@example.com or +123 567 89000",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Password",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                  CupertinoTextField(
                    obscureText: true,
                    controller: passwordController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "*************",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Confirm Password", 
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  CupertinoTextField(
                    controller: confirmPasswordController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "*************",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    obscureText: true, // Ocultar senha
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:60, right: 40, top: 20),
              child:  Text("By continuing, you agree to Terms of Use and Privacy Policy.",
                            style: TextStyle(fontSize: 14, color: Colors.white))),
            ElevatedButton(
            onPressed:_saveUser,
             style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.white, width: 1)
                ),
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.09),
              ),
              child: Text("Sing Up",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700)),
            ),
            Text("or sign up with",
                style: TextStyle(fontSize: 14, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Color.fromRGBO(179, 160, 255, 1),
                  size: 28.0,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.facebook,
                  color: Color.fromRGBO(179, 160, 255, 1),
                  size: 30.0,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.fingerprint,
                  color: Color.fromRGBO(179, 160, 255, 1),
                  size: 30.0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: Color.fromRGBO(179, 160, 255, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoginPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
