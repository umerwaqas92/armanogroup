import 'package:armanogroup/screens/home_dashboard/home_screen.dart';
import 'package:armanogroup/screens/signup/signup.dart';
import 'package:armanogroup/screens/signup/widgets/PasswordTextField.dart';
import 'package:armanogroup/screens/signup/widgets/TextField.dart';
import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  bool isloading=false;

  final _formKey = GlobalKey<FormState>();
  String _password="";
  String _email="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: isloading?Container(
          color: MyColors.background_white,
          child:SpinKitSquareCircle(
            color: MyColors.background_red,
            size: 50.0,


          )
      ): Container(
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
                                   key: _formKey,

                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[

                                       SizedBox(height: 100),

                                       MYTextField("Email"," XXXX@gmail.com",TextInputType.emailAddress,(val){
                                         _email=val;

                                       },(val){
                                         if(val == ""){
                                           return "Country must no eampty";
                                         }
                                       },1,""),

                                       SizedBox(height: 10),


                                       MYTextFieldPassword("Password"," ",TextInputType.visiblePassword,(val){
                                         _password=val;

                                       },(val){
                                         if(val == ""){
                                           return "Password must no emapty";
                                         }
                                       },),
                                       SizedBox(height: 10),

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
                           child: InkWell(
                             onTap: () async {

                               try{
                                 print("trying to login...");
                                 _formKey.currentState.save();

                                 setState(() {
                                   isloading=true;
                                 });
                                 var use= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);

                                 Navigator.pop(context);

                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => HomeDashBoard()),
                                 );

                               }catch(er){
                                 setState(() {
                                   isloading=false;
                                 });
                               }

                             },
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
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
