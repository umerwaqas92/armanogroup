import 'package:armanogroup/screens/chat_screen.dart';
import 'package:armanogroup/screens/detail_offer/details_offer.dart';
import 'package:armanogroup/screens/splash_screen.dart';
import 'package:armanogroup/utills/MyColors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeDashBoard extends StatefulWidget {

  static  FirebaseUser user;

  @override
  _HomeDashBoardState createState() => _HomeDashBoardState();
}







class _HomeDashBoardState extends State<HomeDashBoard> {
  List<OfferData> offers=List();

  Future<void> getuserid() async {
    HomeDashBoard.user=await FirebaseAuth.instance.currentUser();
    print("user id"+HomeDashBoard.user.uid);
  }




  Future<void> getServices() async {
    print("getting services");
  var snaps=await Firestore.instance.collection("services").getDocuments();
    print("got snaps"+snaps.documents.length.toString());
     snaps.documents.forEach((snap){
       List<dynamic> list=snap["services"];

      var data=OfferData(id: snap.documentID,title: snap["title"],desc: snap["desc"],img: snap["img"],services:list ,purchased: snap["purchased"],bookmarked: false);

      offers.add(data);


    });
    print("got snaps"+offers.length.toString());
    setState(() {

    });



  }

  Image myImage;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myImage= Image.asset("assets/images/dummy_image_square.jpg");

    getServices();
    getuserid();





  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }


  @override
  Widget build(BuildContext context) {
    final  size=MediaQuery.of(context).size;
    final header_heoght=size.height/7;
    final navigation=size.height/12;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);




    return Scaffold(


      body: Container(

        color: MyColors.background_white,
        width: size.width,
        height: size.height,

        child: Stack(
          children: <Widget>[

            Positioned(
              top: header_heoght-30,
              width: size.width,
                height: size.height,

                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: offers.length,
                  itemBuilder: (c,i){
                    return buildCard(offers[i]);
                  },

                ),

            ),
            Positioned(
              top: 0,
              child: buildHEader(size,header_heoght),
            ),
            Positioned(
              bottom: 0,
              child: Container(

                decoration: BoxDecoration(
                  color: MyColors.dark_bloe1,
                  borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(30) ,
                      topRight: Radius.circular(30)
                  ),

                ),

                height: navigation,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            buildNavigationBtn("Home",Icons.home,MyColors.background_red,(){

                            }),
                            buildNavigationBtn("Chat",Icons.message,MyColors.background_white,(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatScreen()),
                              );

                            }),
                            buildNavigationBtn("Account",Icons.person,MyColors.background_white,(){

                            }),

                          ],
                        ),
                      ),
                    )

                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }

  Widget buildCard(OfferData data) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailOffer(data)),
                      );
                    },
                    splashColor: Colors.amber,
                    child: Hero(
                      tag: data.id,
                      child: Container(


                        height: 300,


                          child: Container(



                            decoration: BoxDecoration(
//                              image:DecorationImage(
//                                image: NetworkImage(data.img),
//                                fit: BoxFit.cover,
//                              ),
                              borderRadius: BorderRadius.only(

                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),

                              shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                              //color: const Color(0xFF66BB6A),

                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 10.0,
                                ),],


                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(

                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),


                              child: FadeInImage(

                                width: MediaQuery.of(context).size.width,


                                image: data==null?NetworkImage(data.img):AssetImage("assets/images/dummy_image_square.jpg"),
                                fit: BoxFit.cover,
                                placeholder: AssetImage("assets/images/dummy_image_square.jpg"),
                              ),
                            ),
                          ),


                      ),
                    ),
                  ),
                  Hero(
                    tag: data.id+"124",
                    child: Container(


                      height: 80,
                      child:Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(

                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          color:MyColors.dark_bloe1,
                          shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                          //color: const Color(0xFF66BB6A),



                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                bottom: -50,
                                left: -10,
                                child: _circularContainer(400, Colors.white.withOpacity(0.02),borderColor: Colors.transparent)
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
                              top: 30,
                              right: 30,
                              child: Text("View more",style: TextStyle(color: MyColors.background_white,decoration: TextDecoration.none))
                            ),
                            Positioned(
                              top: 20,
                              left: 30,

                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data.title,style: TextStyle(color: MyColors.background_white,fontSize: 20,decoration: TextDecoration.none),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    data.purchased.toString()+"+ Purchased",style: TextStyle(color: Colors.white70,fontSize: 11,decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Container buildHEader(Size size,height) {
    return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight:Radius.circular(30) ,
                      bottomLeft: Radius.circular(30)
                  ),
                  color: MyColors.dark_bloe1,
                  shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                  //color: const Color(0xFF66BB6A),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10.0,
                  ),],
              ),

              height: height,
              width: size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: -50,
                      right: -10,
                      child: _circularContainer(300, Colors.white.withOpacity(0.01),borderColor: Colors.transparent)
                  ),
                  Positioned(
                      top: -10,
                      right: -10,
                      child: _circularContainer(400, Colors.transparent,borderColor: Colors.white.withOpacity(0.1))
                  ),
                  Positioned(
                      top: -10,
                      right: -10,
                      child: _circularContainer(200, Colors.transparent,borderColor: Colors.white.withOpacity(0.1))
                  ),
                  Positioned(
                    top: height/20,
                    left:  size.width/2 -50,

                    child: Container(

                      child: Wrap  (
                        direction: Axis.vertical,
                        spacing: -1* (size.height/30),
                        children: <Widget>[
                          Container(
                            width: size.height/8,
                            height: size.height/8,
                            child: Image(
                              image: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                          Text(" Services",style: TextStyle(color: MyColors.background_white,fontSize: height/5),)
                        ],
                      ),
                    ),
                  )


                ],
              ),
            );
  }

  FlatButton buildNavigationBtn(title,icon,color,func) {
    return FlatButton(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 15, 8, 1),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    icon,
                                    color: color,
                                    size:25,
                                  ),
                                  Text(title,style: TextStyle(color: color,fontSize: 11),)
                                ],
                              ),
                            ),
                            onPressed: func,
                            shape:  CircleBorder(),
                            splashColor: Colors.black.withAlpha(5),



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
