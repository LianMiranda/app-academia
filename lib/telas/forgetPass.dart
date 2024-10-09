import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/setPassword.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgotten Password",
          style: TextStyle(color: Color.fromRGBO(226, 241, 99, 1)),
        ),
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        leading: IconButton(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50), 
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(179, 160, 255, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your email address",
                      style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    CupertinoTextField(
                      cursorColor: Colors.black,
                      padding: EdgeInsets.all(15),
                      placeholder: "example@example.com",
                      placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SetPasswordPage()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white, width: 1)
                  ),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.09),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
