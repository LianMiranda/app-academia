import 'dart:async'; // Necessário para o Timer
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          context, '/home'); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
            child: Image.asset(
              'assets/images/telaWelcome.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 25.47,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(226, 241, 99, 1),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset("assets/images/Group.png", width: 182.37, height: 84.76,),
                Image.asset("assets/images/FITBODY.png", width: 800, height: 81.05,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
