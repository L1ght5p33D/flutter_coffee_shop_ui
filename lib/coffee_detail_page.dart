import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';


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

  bool sm_active = true;
  bool md_active = false;
  bool lg_active = false;

  bool is_favorite = false;

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
                          color: Colors.blueGrey[900],
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
                          color: Colors.blueGrey[800],
                        ),
                        width: ss.width * .12,
                        height: ss.width * .12,
                        child:
                        IconButton(
                          onPressed: (){
                            setState(() {
                              is_favorite = !is_favorite;
                            });
                          },
                          padding: EdgeInsets.all(ss.width*.02),
                          splashRadius: ss.width * .2,
                          icon: Icon(Icons.favorite,
                            color: is_favorite?Colors.red[800]:Colors.grey[700],
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
          ),
          Padding(
          padding: EdgeInsets.all(ss.width*.02),
              child:
              Text("Description", style: TextStyle(
              fontSize: ss.width*.04,
              fontWeight: FontWeight.w300,
              color: Colors.white
          ),)
          ),
        Padding(
          padding: EdgeInsets.all(ss.width*.02),
          child: ExpandableText(
            widget.ci_data!["long_description"],
            style: TextStyle(
              fontSize: ss.width*.03,
              color: Colors.white
            ),
            trimType: TrimType.lines,
            trim: 3,
            readLessText: 'Less',
            readMoreText: 'Tap for more',
            linkTextStyle:  TextStyle(
                color: Colors.deepOrange,
                fontSize: ss.width*.03,
                fontWeight: FontWeight.bold),
            onLinkPressed: (expanded) {},
          )),
          Padding(
              padding: EdgeInsets.all(ss.width*.02),
              child:
              Text("Size", style: TextStyle(
                  fontSize: ss.width*.04,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
              ),)
          ),

          Padding(
              padding: EdgeInsets.all(ss.width*.02),
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              GestureDetector(
            onTap: (){setState(() {
              sm_active = true;
              md_active = false;
              lg_active = false;
            });},
              child:Container(                        height: ss.width*.1,
                  width:ss.width*.3,
              decoration: BoxDecoration(
                color: sm_active? Colors.grey[900]: Colors.blueGrey[800],
                borderRadius: BorderRadius.circular(ss.width*.04),
                border: sm_active? Border.all(color: Colors.deepOrange,
                    width: 1.0): null

              ),
              child:Center(child:Text("S"))
              )),

                GestureDetector(
                    onTap: (){setState(() {
                      sm_active = false;
                      md_active = true;
                      lg_active = false;
                    });},
                    child:Container(                        height: ss.width*.1,
                        width:ss.width*.3,
                        decoration: BoxDecoration(
                            color: md_active? Colors.grey[900]: Colors.blueGrey[800],
                            borderRadius: BorderRadius.circular(ss.width*.04),
                            border: md_active? Border.all(color: Colors.deepOrange,
                                width: 1.0): null

                        ),
                        child:Center(child:Text("M"))
                    )),

                GestureDetector(
                    onTap: (){setState(() {
                      sm_active = false;
                      md_active = false;
                      lg_active = true;
                    });},
                    child:Container(
                        height: ss.width*.1,
                        width:ss.width*.3,
                        decoration: BoxDecoration(
                            color: lg_active? Colors.grey[900]: Colors.blueGrey[800],
                            borderRadius: BorderRadius.circular(ss.width*.04),
                            border: lg_active? Border.all(color: Colors.deepOrange,
                                width: 1.0): null

                        ),
                        child:Center(child:Text("L"))
                    ))

            ],),
          ),
          Padding(padding: EdgeInsets.all(ss.width*.02),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
            Container(width:ss.width*.2,
                      height:ss.width*.17,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                  Text("Price",
                  style: TextStyle(fontSize: ss.width*.034,
                                    fontWeight: FontWeight.w300)),
            Text("\$" + widget.ci_data!["price"]),
            ])),

            Container(
                height: ss.width*.17,
                width:ss.width*.7,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(ss.width*.06),
                ),
                child:Center(child:Text("Buy Now"))
            )

          ]),
          Padding(padding: EdgeInsets.all(ss.width*.02),),
        ],)
    )));
  }
}
