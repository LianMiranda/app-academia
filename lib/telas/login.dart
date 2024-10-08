import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/singup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Log In",
            style: TextStyle(color: Color.fromRGBO(226, 241, 99, 1))),
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Color.fromRGBO(179, 160, 255, 1), // Cor de fundo roxa
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username or email", // Label para o campo de e-mail
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  CupertinoTextField(
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "example@example.com",
                    placeholderStyle:
                        TextStyle(color: Colors.black, fontSize: 14),
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
                    "Password", // Label para o campo de e-mail
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  CupertinoTextField(
                    cursorColor: Colors.black,
                    padding: EdgeInsets.all(15),
                    placeholder: "*************",
                    placeholderStyle:
                        TextStyle(color: Colors.black, fontSize: 14),
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              child: Text("Log In",
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
                  text: "Don’t have an account? ",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign Up",
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
                                  SignUpPage(), // Direciona para outra página
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
