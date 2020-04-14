import 'package:armanogroup/screens/detail_offer/details_offer.dart';
import 'package:armanogroup/screens/signup/widgets/MyButton.dart';
import 'package:armanogroup/screens/signup/widgets/TextField.dart';
import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class OfferMakeData {
  OfferData data;
  String email,name,copmanyname,desc,ebudget;

  OfferMakeData({this.data, this.email, this.name, this.copmanyname, this.desc,
      this.ebudget});


}

class MakeOffer extends StatefulWidget {

  OfferData data;

  MakeOffer(this.data);

  @override
  _MakeOfferState createState() => _MakeOfferState(this.data);
}

class _MakeOfferState extends State<MakeOffer> {

  OfferData offerdata;


  _MakeOfferState(this.offerdata);

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.white, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  OfferMakeData data=OfferMakeData();

  FirebaseUser user;

  Future<void> getuser() async {
    user =await  FirebaseAuth.instance.currentUser();
    setState(() {

    });
  }


  bool isloading=false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    final header_heoght=size.height/7;
    final navigation=size.height/12;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: MyColors.background_white,
      body:  isloading?Container(
          color: MyColors.background_white,
          child:SpinKitSquareCircle(
            color: MyColors.background_red,
            size: 50.0,


          )
      ):Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                child: Container(

                  decoration: BoxDecoration(
                    color: MyColors.dark_bloe1,
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(30) ,
                        topRight: Radius.circular(30)
                    ),

                  ),

                  height: header_heoght,
                  width: size.width,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: -50,
                          left: -10,
                          child: _circularContainer(200, Colors.white.withOpacity(0.05),borderColor: Colors.transparent)
                      ),
                      Positioned(
                          top: -10,
                          right: -10,
                          child: _circularContainer(300, Colors.transparent,borderColor: Colors.white.withOpacity(0.1))
                      ),
                      Positioned(
                          top: -10,
                          right: -10,
                          child: _circularContainer(200, Colors.transparent,borderColor: Colors.white.withOpacity(0.1))
                      ),
                      Positioned(
                        top: header_heoght/2,

                        child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: <Widget>[IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),), Text("Make Offer",style: TextStyle(color: Colors.white,fontSize: 18),),SizedBox(width: 20),SizedBox(width: 10,)]),

                      )





                    ],

                  ),
                )
            ),
            Positioned(
              top: 200,
              child: Container(
                width: size.width,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color:Colors.white,
                  shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                  //color: const Color(0xFF66BB6A),




                ),

                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
//                    MYTextField(r"Name","Waqas",TextInputType.number,
//                            (val){
//                          data.name=val;
//
//                        },(val){
//                          if(val == ""){
//                            return "Name must not be eampty";
//                          }
//                        },1,user!=null?user.displayName:""),
//                    MYTextField("Email","xxx@gmail.com",TextInputType.number,
//                            (val){
//                          data.email=val;
//
//                        },(val){
//                          if(val == ""){
//                            return "Budget must not be eampty";
//                          }
//                        },1,user!=null?user.displayName:""),
                      MYTextField(r"Budget","\$200",TextInputType.number,
                              (val){
                            data.ebudget=val;

                          },(val){
                            if(val == ""){
                              return "Budget must not be eampty";
                            }
                          },1,""),
                      SizedBox(height: 20,),
                      MYTextField(r"Project Description","My requirments are ..",TextInputType.number,
                              (val){
                            data.desc=val;

                          },(val){
                            if(val == ""){
                              return "Budget must not be eampty";
                            }
                          },10,""),



                    ],

                  ),
                ),



              ),


            ),
            Positioned(
                bottom: -5,
                left: -10,
                child: MyButtonRed(Data(0,0,0,0,"Submite",null,() async {
                  data.data=offerdata;
                  _formKey.currentState.save();

                  if(_formKey.currentState.validate()){
                    isloading=true;
                    setState(() {

                    });
                    user=await FirebaseAuth.instance.currentUser();
                    await Firestore.instance.collection("offers").document().setData({
                      "time":FieldValue.serverTimestamp(),
                      "user":Firestore.instance.collection("users").document(user.uid),
                      "budget":data.ebudget,
                      "desc":data.desc,
                      "email":user.email,
                      "na,e":user.displayName,
                      "photo":user.photoUrl,
                      "service":data.data.title,
                      "service_id":Firestore.instance.collection("services").document(data.data.id),

                    });


                    Navigator.pop(context);

                    setState(() {
                      isloading=false;
                    });
                  }


                }))
            ),
          ],
        ),
      ),

    );


  }


}
