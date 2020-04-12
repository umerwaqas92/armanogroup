import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';

class MyButtonRed extends StatefulWidget {

  Data data;


  MyButtonRed(this.data);

  @override
  _MyButtonRedState createState() => _MyButtonRedState(data);
}

class _MyButtonRedState extends State<MyButtonRed> {

  Data data ;


  _MyButtonRedState(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(


      width: MediaQuery.of(context).size.width,


      height: MediaQuery.of(context).size.height/12,
      child: InkWell(
        onTap: (){


          print("clicked registrations");
        },
        splashColor: Colors.white,
        child: Card(


            semanticContainer: true,

            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: MyColors.background_red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              bottomRight:  Radius.circular(data.bottomRight),
                bottomLeft: Radius.circular(data.bottomRight) ,
                topLeft: Radius.circular(data.topLeft),
                topRight: Radius.circular(data.topRight))),

            child:Container(
              decoration: BoxDecoration(
                  image:  DecorationImage(
                    image: AssetImage("assets/images/button_red_background.png"),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    data.ico,
                    color: Colors.white,
                  ),
                  Text(data.title,style: TextStyle(fontSize: 20,color: Colors.white),),

                ],
              )),
            )


        ),
      ),
    );
  }
}

class Data{
  double topLeft,topRight,bottomLeft,bottomRight;
  String title;
  IconData ico;

  Data(this.topLeft, this.topRight, this.bottomLeft, this.bottomRight,
      this.title, this.ico);


}
