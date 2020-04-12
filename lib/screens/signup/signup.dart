import 'package:armanogroup/screens/signup/widgets/MyButton.dart';
import 'package:armanogroup/screens/signup/widgets/PasswordTextField.dart';
import 'package:armanogroup/screens/signup/widgets/TextField.dart';
import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {



  @override
  _SignupState createState() => _SignupState();
}

final _formKey = GlobalKey<FormState>();


class _SignupState extends State<Signup> {

  String email,name,country,copmnyname,password,retypepassword;

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
                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),), Text("Signup",style: TextStyle(color: Colors.white,fontSize: 18),),SizedBox(width: 10)]),
//                  SizedBox(height:10),

                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Wrap(
                        direction: Axis.vertical,
                        spacing: -10,
                        children: <Widget>[
                          Container(

                            width: MediaQuery.of(context).size.width,


                            height: (MediaQuery.of(context).size.height/2)+100,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                              },

                              child: Card(


                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0))),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Form(
                                    key: _formKey,

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[

                                        SizedBox(height: 20),

                                        MYTextField("Email"," xxx@gmail.com",TextInputType.emailAddress,
                                                (val){
                                          email=val;

                                        },(val){
                                          if(val == ""){
                                            return "Email must no eampty";
                                          }
                                        }),
                                      SizedBox(height: 10),
                                        MYTextField("Name"," Waqas",TextInputType.emailAddress,
                                                (val){
                                              name=val;

                                            },(val){
                                              if(val == ""){
                                                return "Name must no eampty";
                                              }
                                            }),
                                        SizedBox(height: 10),
                                        MYTextField("Country"," Pakistan",TextInputType.emailAddress,(val){
                                         country=val;

                                        },(val){
                                          if(val == ""){
                                            return "Country must no eampty";
                                          }
                                        }),
                                        SizedBox(height: 10),
                                        MYTextFieldPassword("Password"," ",TextInputType.emailAddress,(val){
                                          password=val;

                                        },(val){
                                          if(val == ""){
                                            return "Password must no emapty";
                                          }
                                        }),
                                        SizedBox(height: 10),
                                        MYTextFieldPassword("Retype Password"," ",TextInputType.emailAddress,(val){
                                          password=val;

                                        },(val){
                                          if(val != password){
                                            return " Password not matched";
                                          }
                                        })



//                                      MYTextField("Name"," Waqas",TextInputType.text),
//                                      MYTextField("Country"," Pakistan",TextInputType.text),
//                                      MYTextField("Company Name"," Appsvo",TextInputType.text),
//                                      PasswordMYTextField("Password","",TextInputType.visiblePassword),


                                      ],
                                    ),
                                  ),
                                ) ,


                              ),
                            ),
                          ),




                          Container(

                            width: MediaQuery.of(context).size.width,


                            height: MediaQuery.of(context).size.height/12,
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
                                  child: Center(child: Text("Signup",style: TextStyle(fontSize: 20,color: Colors.white),)),
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
              child: MyButtonRed(Data(0,0,0,0,"Create an Account",null))
            ),
          ],
        ),
      ),
    );
  }
}
