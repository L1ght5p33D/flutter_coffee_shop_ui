import 'package:flutter/material.dart';
import 'dart:ui';

Route createRoute(Map ci_data) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Coffee_Detail_View(ci_data: ci_data,),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Coffee_Detail_View extends StatefulWidget {
   Coffee_Detail_View({Key? key, this.ci_data}) : super(key: key);

  //coffee item data
    Map? ci_data;

  @override
  _Coffee_Detail_ViewState createState() => _Coffee_Detail_ViewState();
}

class _Coffee_Detail_ViewState extends State<Coffee_Detail_View> {
  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;
    return Scaffold(body:SafeArea(child:
    Container(
        height:ss.height ,
        child: ListView(children: [
          Container(
            height: ss.height * .67,
            child:Stack(children: [

              Image.asset(widget.ci_data!["image_data"],
                          width: ss.width,
                          height: ss.height * .67,
                        fit: BoxFit.cover,
                ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(ss.width*.03),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ss.width * .06),
                          color: Colors.grey[900],
                        ),
                        width: ss.width * .12,
                        height: ss.width * .12,
                        child:
                        IconButton(
                          onPressed: (){Navigator.pop(context);
                          },
                          padding: EdgeInsets.all(ss.width*.02),
                          splashRadius: ss.width * .2,
                          icon: Icon(Icons.view_array_outlined,
                            color: Colors.grey[500],
                            size: ss.width*.06,
                          ),

                        ))),
                    Padding(
                      padding: EdgeInsets.all(ss.width*.03),
                     child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ss.width * .06),
                          color: Colors.grey[900],
                        ),
                        width: ss.width * .12,
                        height: ss.width * .12,
                        child:
                        IconButton(
                          onPressed: (){},
                          padding: EdgeInsets.all(ss.width*.02),
                          splashRadius: ss.width * .2,
                          icon: Icon(Icons.favorite,
                            color: Colors.red[800],
                            size: ss.width*.06,
                          ),

                        ))),

                  ],),

              ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    width: ss.width * .95,
                    height: ss.height * .18,
                    // decoration: new BoxDecoration(
                    //     color: Colors.grey.shade200.withOpacity(0.5)
                    // ),
                    child: Row(children: [
                      Container(height:ss.height*.17,
                                width: ss.width *.48,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text(widget.ci_data!["main_name"]),
                          Text(widget.ci_data!["secondary_text"],
                              style: TextStyle(fontSize: ss.width*.04,
                                                fontWeight: FontWeight.w300),),
                          Container(width:ss.width*.36,
                                    child:Row(children: [
                                      Icon(Icons.star,
                                          color: Colors.deepOrange,
                                        size: ss.width * .044,
                                      ),
                                      Text(widget.ci_data!["rating"]),
                                      Text(" (" + widget.ci_data!["total_ratings"] +")",
                                          style: TextStyle(fontSize: ss.width*.036,
                                          fontWeight: FontWeight.w300)
                                      )
                                    ],)
                          )
                        ],)
                      ),

                      Container(height:ss.height*.17,
                        width: ss.width *.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                      Container(
                      width:ss.width*.12,
                      height: ss.width * .12,
                      padding:EdgeInsets.all(ss.width*.02),
                        decoration: BoxDecoration(borderRadius:
                        BorderRadius.circular(ss.width*.03),
                            color:Colors.blueGrey[900]
                        ),child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[Icon(Icons.coffee_maker_outlined,
                              size:ss.width*.035,
                          color: Colors.deepOrange,),
                                                Text("Coffee",
                                                    style: TextStyle(fontSize: ss.width*.025))
                      ])),
                              Container(
                                  width:ss.width*.12,
                                  height: ss.width * .12,
                                  padding:EdgeInsets.all(ss.width*.02),
                                  decoration: BoxDecoration(borderRadius:
                                  BorderRadius.circular(ss.width*.03),
                                      color:Colors.blueGrey[900]
                                  ),child:
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                              Icon(Icons.invert_colors,
                                    size:ss.width*.035,
                                  color: Colors.deepOrange),
                                Text("Milk",
                                    style: TextStyle(fontSize: ss.width*.025))]))
                            ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Container(
                            // width:ss.width*.25,
                            // height: ss.width * .05,
                            padding:EdgeInsets.all(ss.width*.02),
                            decoration: BoxDecoration(borderRadius:
                            BorderRadius.circular(ss.width*.04),
                            color:Colors.blueGrey[900]
                            ),child:Center(child:Text("Medium Roasted",
                                    style: TextStyle(fontSize: ss.width*.03),))
                          )],)

                      ],))
                    ],)
                  )),

              )],)
            ],)
          )
        ],)
    )));
  }
}
