
import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:armanogroup/screens/home_dashboard/home_screen.dart';
import 'package:armanogroup/utills/MyColors.dart';
import 'package:armanogroup/utills/bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  TextEditingController _controller=TextEditingController();
  bool issending=false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();




  }



  @override
  Widget build(BuildContext context) {


    var size=MediaQuery.of(context).size;
    final header_heoght=size.height/8;
    final navigation=size.height/14;
    String _msg="";


    return Scaffold(
      backgroundColor: MyColors.dark_bloe1,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
                bottom: 300,
                left: -200,
                child: _circularContainer(500, Colors.white.withOpacity(0.01),borderColor: Colors.transparent)
            ),
            Positioned(
                bottom: -50,
                left: -10,
                child: _circularContainer(300, Colors.white.withOpacity(0.01),borderColor: Colors.transparent)
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
              bottom: 0,
              child: Container(
                width: size.width,
                color: MyColors.background_white,


//                decoration: BoxDecoration(
//                  color: MyColors.background_white,
//                  borderRadius: BorderRadius.only(
//                      topLeft:Radius.circular(30) ,
//                      topRight: Radius.circular(30)
//                  ),

//                ),


                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _controller,
                    onChanged: (val){
                      _msg=val;

                    },

                    maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        enabled: !issending,


                        suffixIcon:issending?Container(
                          width: 50,
                          height: 50,
                          child: InkWell(
                            child: SpinKitFadingCircle(

                              color: MyColors.dark_bloe1,
                              size: 40.0,
                              duration: Duration(milliseconds: 700),
                            ),
                          ),
                        ):  IconButton(icon:Icon(Icons.send,color: MyColors.dark_bloe1,),onPressed: ()  async {
//                          send msg
//                          _controller.selection();
                        print("sending messages to...."+_msg);
                          var user=await FirebaseAuth.instance.currentUser();
                          setState(() {
                            issending=true;

                          });




                         await Firestore.instance.collection("conversations").document(user.uid)
                              .collection("messages").document().setData({
                            "content":_msg,
                            "time":FieldValue.serverTimestamp(),
                            "type":0,
                            "status":0,
                            "from":user.uid,
                            "read":0,


//                            "to":user.uid,



                          },merge: true);
                       await Firestore.instance.collection("conversations").document(user.uid)
                            .setData({
                          "last_content":_msg,
                          "time":FieldValue.serverTimestamp(),


                          "from":user.uid,
                          "unreadmsg":FieldValue.increment(1)



//                            "to":user.uid,



                        },merge: true);
//                          _controller.clear();
//                          Timer(Duration(milliseconds: 100),(){
                            _controller.clear();
                            setState(() {
                              issending=false;
//                            });

                          });

//                          setState(() {
//
//                          });
                        }),

                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(width: 0, color: MyColors.background_white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(width: 0, color: MyColors.background_white)),

                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(width: 0, color: MyColors.background_white)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(width: 0, color: MyColors.background_white)),
                        hintText: "Your message..."





                      )
                  ),
                ),

              ),
            ),
            Positioned(
              bottom: 100,
              child: Container(
                width: size.width,
                height: size.height,
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('conversations')
                      .document(HomeDashBoard.user.uid)
                      .collection("messages")
                      .orderBy('time', descending: true)
                      .limit(20)
                      .snapshots(),


                  builder: (c, snap){
                    if (snap.hasData){
                     var list =snap.data.documents;
                     return ListView.builder(
                       reverse: true,


                       itemCount: list.length,
                       itemBuilder: (context,i){
                         DocumentSnapshot snapshot=snap.data.documents[i];
                         bool ismine=(HomeDashBoard.user.uid==snapshot["from"]);


                         return Container(





                              child: Bubble(
                                margin: BubbleEdges.only(top: 10),
                                nip: ismine?BubbleNip.rightTop:BubbleNip.leftTop,
                                alignment: ismine?Alignment.centerRight:Alignment.centerLeft,
                                color:MyColors.background_white.withAlpha(30),
                                child: Text(snapshot["content"], textAlign: ismine?TextAlign.left:TextAlign.right, style: TextStyle(color: MyColors.background_white,fontSize: 16.0,wordSpacing: 10)),
                              ),


//                             child: Container(
//                               color: Colors.red,
//                               padding: EdgeInsets.all(10),
//                               width: MediaQuery.of(context).size.width/4,
//
//                               alignment: Alignment.centerRight,
//                               child:  Text(snapshot["content"],style: TextStyle(color: Colors.white),)
//                               ,
//                             )

                         );
                       },
                     );

                    }else{
                      return Text("No data");
                    }
                  },
                ),

              ),
            ),
            Positioned(


              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  color: MyColors.dark_bloe1,
                  width: size.width,
                  height: header_heoght,
                  child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[IconButton(onPressed: (){

                    Navigator.pop(context);
                  },icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),), Text("Chat",style: TextStyle(color: Colors.white,fontSize: 18),),Text("online  ",style: TextStyle(color: MyColors.background_red,fontSize: 14),)])),

            ),

          ],
        ),
      ),

    );
  }

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



}
