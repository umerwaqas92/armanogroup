import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: (MediaQuery.of(context).size.height/2)-150),
              Image(
                width: 210,
                height: 210,
                image: AssetImage("assets/images/logo.png"),
              ),
              Text("Armano Group",style: TextStyle(fontSize: 20,color: Colors.white),),
              SizedBox(height: (MediaQuery.of(context).size.height/3)-10),
              Text("V 1.0.0",style: TextStyle(fontSize: 11,color: Colors.white70),)
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}
