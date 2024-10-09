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
    // Navega automaticamente para a tela principal após 3 segundos
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, '/home'); // Mude para a tela principal
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
              'assets/telaWelcome.png',
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
                Image.asset("assets/GroupNormal.png", width: 182.37, height: 84.76,),
                SizedBox(height: 5),
                Image.asset("assets/FITBODY.png", width: 374.09, height: 81.05,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
