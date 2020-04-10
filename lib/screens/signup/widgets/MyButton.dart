import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {


  
  @override
  Widget build(BuildContext context) {
    return Container(


      width: MediaQuery.of(context).size.width,


      height: MediaQuery.of(context).size.height/12,
      child: InkWell(
        onTap: (){


          print("clicked registrations");
        },
        splashColor: Colors.green,
        child: Card(


            semanticContainer: true,

            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: MyColors.background_red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
            child:Container(
              decoration: BoxDecoration(
                  image:  DecorationImage(
                    image: AssetImage("assets/images/button_red_background.png"),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(child: Text("Create Account",style: TextStyle(fontSize: 20,color: Colors.white),)),
            )


        ),
      ),
    );
  }
}
