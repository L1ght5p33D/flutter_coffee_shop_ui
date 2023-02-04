import 'package:flutter/material.dart';


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
                    Container(
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

                        )),
                    Container(
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

                        )),

                  ],)

                ],)
            ],)
          )
        ],)
    )));
  }
}
