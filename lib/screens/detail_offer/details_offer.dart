import 'package:armanogroup/screens/login/login.dart';
import 'package:armanogroup/screens/offer_make/offer_make.dart';
import 'package:armanogroup/screens/signup/widgets/MyButton.dart';
import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class DetailOffer extends StatefulWidget {

  OfferData data;


  DetailOffer(this.data);

  @override
  _DetailOfferState createState() => _DetailOfferState(data);
}

class _DetailOfferState extends State<DetailOffer> {
  OfferData data;


  _DetailOfferState(this.data);
  SolidController _controller = SolidController();


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    final double imgheight=size.height/2.5;

    print("services lenght"+data.services.length.toString());


    return Scaffold(

//      bottomSheet: SolidBottomSheet(
//        headerBar: null,
//        body: MakeOffer(),
//        showOnAppear: true,
//        maxHeight: 400,
//        draggableBody: true,
//        key: Key("bottom"),
//
//
//      ),


      body: Container(
          width: size.width,
          height: size.height,
          color: MyColors.background_white,
          child: Stack(
            children: <Widget>[


               Positioned(
                  top: 0,
                    child: Hero(
                      tag: data.id,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data.img),
                            fit: BoxFit.cover
                          )
                        ),
                        width: size.width,
                        height: imgheight,


                      ),
                    ),


                ),


              Positioned(
                top: imgheight-50,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(

                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: MyColors.dark_bloe1,
                  ),

                  width: size.width,
                  height: size.height-imgheight+50,
                  child: Hero(
                    tag: data.id+"124",
                    child: Container(
                      child:Stack(
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
//                          Positioned(
//                            top: 30,
//                            right: 30,
//                            child: IconButton(
//                              icon: Icon(
//                                data.bookmarked?Icons.bookmark:Icons.bookmark_border,
//                                color: MyColors.background_red,
//                              ),
//                            ),
//                          ),

                          Positioned(
                            top: imgheight/16,
                              left: 20,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                    width: 50,
                                        height: 50,
                                        child: MaterialButton(
                                          onPressed: (){
                                            Navigator.pop(context);

                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width-100,
                                        child: Column(

                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(data.title,style: TextStyle(color: MyColors.background_white,fontSize: 20,decoration: TextDecoration.none),),
                                            SizedBox(height: 10,),
                                            Text(data.purchased.toString()+ "Purchased",style: TextStyle(color: MyColors.background_white,fontSize: 11,decoration: TextDecoration.none),),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: size.width-100,
                                    child: Text(data.desc,style: TextStyle(color: MyColors.background_white,fontSize: 11,decoration: TextDecoration.none),),


                                  ),
                                 Container(

                                   width: size.width,
                                   height: 200,
                                   child: ListView.builder(
                                     shrinkWrap: true,
                                       itemCount: data.services.length,

                                       itemBuilder: (c,i){

                                    return Container(
                                      padding: EdgeInsets.fromLTRB(50, 0, 10, 0),

                                       width: size.width,
                                       height: 30,
                                       child: Row(

                                         children: <Widget>[
                                           Icon(Icons.check_circle,color: MyColors.background_white,), SizedBox(width: 10,),Text(data.services[i].toString(),style: TextStyle(color: Colors.white),)
                                         ],
                                       ),
                                     );
                                   }),
                                 )
                                ],
                              ))
                        ],
                      ) ,


                    ),
                  ),


                ),

              ),



              Positioned(
                bottom: -10
                ,
                child: InkWell(

                  child: Container(
                      width: size.width,
                      height: 80,
                      child: MyButtonRed(Data(40,40,0,0,"Make an Offer",Icons.new_releases,() async {
                        if(await FirebaseAuth.instance.currentUser()==null){
                        Navigator.pop(context);

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                        );
                        }else{
                          _controller.show();

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MakeOffer(data)),
                        );
                        }
                      }))),
                ),
              )

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

class OfferData{
  String title,desc,id,img;
      List<dynamic> services;
      int purchased;
      bool bookmarked =false;


  OfferData({this.title, this.desc, this.id, this.img, this.services,
      this.purchased,this.bookmarked});

}
