import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen.png"),
            fit: BoxFit.cover,
          ),

        ),

        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/20),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),), Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),),SizedBox(width: 10)]),
                  SizedBox(height: MediaQuery.of(context).size.height/30),

                 ListView(
                   shrinkWrap: true,
                   children: <Widget>[
                     Wrap(
                       direction: Axis.vertical,
                       spacing: -10,
                       children: <Widget>[
                         Container(

                           width: MediaQuery.of(context).size.width,


                           height: (MediaQuery.of(context).size.height/2),
                           child: GestureDetector(
                             behavior: HitTestBehavior.opaque,
                             onVerticalDragStart: (dd){
                               FocusScope.of(context).requestFocus(FocusNode());
                             },

                             child: Card(


                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                   topLeft: Radius.circular(30.0),
                                   topRight: Radius.circular(30.0))),
                               child: Container(
                                 padding: EdgeInsets.all(20),
                                 child: Form(

                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[

                                       SizedBox(height: 100),
                                       TextField(
                                           decoration: InputDecoration(
                                               enabledBorder:  OutlineInputBorder(
                                                 borderSide:  BorderSide(color:MyColors.dark_bloe1, width: 1.0),
                                               ),
                                               focusedBorder:  OutlineInputBorder(
                                                 borderSide:  BorderSide(color: MyColors.background_red, width: 1.0),
                                               ),
                                               labelText: "Email Adress",
                                               hintText: "XXXX@gmail.com"

                                           )
                                       ),
                                       SizedBox(height: 20),
                                       TextField(
                                           decoration: InputDecoration(
                                               enabledBorder:  OutlineInputBorder(
                                                 borderSide:  BorderSide(color:MyColors.dark_bloe1, width: 1.0),
                                               ),
                                               focusedBorder:  OutlineInputBorder(
                                                 borderSide:  BorderSide(color: MyColors.background_red, width: 1.0),
                                               ),
                                               labelText: "Email Adress",
                                               hintText: "XXXX@gmail.com"

                                           )
                                       ),

                                     ],
                                   ),
                                 ),
                               ) ,


                             ),
                           ),
                         ),




                         Container(

                           width: MediaQuery.of(context).size.width,


                           height: 80,
                           child: Card(
                               semanticContainer: true,
                               clipBehavior: Clip.antiAliasWithSaveLayer,
                               color: MyColors.background_red,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(30.0),
                                   bottomRight: Radius.circular(30.0))),
                               child:Container(
                                 decoration: BoxDecoration(
                                     image:  DecorationImage(
                                       image: AssetImage("assets/images/button_red_background.png"),
                                       fit: BoxFit.cover,
                                     )
                                 ),
                                 child: Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),)),
                               )


                           ),
                         ),

                       ],
                     ),
                   ],
                 ),

                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(


                width: MediaQuery.of(context).size.width,


                height: 80,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
