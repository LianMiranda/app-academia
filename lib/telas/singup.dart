import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', nameController.text);
    await prefs.setString('emailorNumber', emailOrNumberController.text);
    await prefs.setString('password', passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cadastro salvo com sucesso!')),
    );
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
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  CupertinoTextField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "Fulano de Souza",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email or Mobile Number",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  CupertinoTextField(
                    controller: emailOrNumberController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "example@example.com or +123 567 89000",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Password",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  CupertinoTextField(
                    obscureText: true,
                    controller: passwordController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "*************",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14),
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
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  CupertinoTextField(
                    controller: confirmPasswordController,
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "*************",
                    placeholderStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                    style: TextStyle(color: Colors.black, fontSize: 14),
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
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              child: Text("Sing Up",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
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
