import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Set Password",
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
                      "Password",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10), 
                    CupertinoTextField(
                      obscureText: true,
                      cursorColor: Colors.black,
                      padding: EdgeInsets.all(15),
                      placeholder: "*************",
                      placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    Text(
                      "Confirm Password",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10), 
                    CupertinoTextField(
                      obscureText: true,
                      cursorColor: Colors.black,
                      padding: EdgeInsets.all(15),
                      placeholder: "*************",
                      placeholderStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      style: TextStyle(color: Colors.black, fontSize: 14),
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
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.5),
                ),
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
