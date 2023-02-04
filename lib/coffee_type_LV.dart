import 'package:flutter/material.dart';
import 'package:coffee_shop_ui/coffee_detail_page.dart';
import 'package:coffee_shop_ui/coffee_types_data.dart';


class Coffee_Type_LV extends StatefulWidget {
  Coffee_Type_LV({Key? key, this.coffee_type: "cappuccino"}) : super(key: key);

  String coffee_type;

  @override
  _Coffee_Type_LVState createState() => _Coffee_Type_LVState();
}

class _Coffee_Type_LVState extends State<Coffee_Type_LV> {
  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;
    return

      Container(
      height: ss.width * .66,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffee_types_data[widget.coffee_type].length,
        itemBuilder: (context, coffee_lv_idx){
        return
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ss.width*.03),
          child:
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(createRoute(
                      coffee_types_data[widget.coffee_type][coffee_lv_idx]));
                  },
          child:
          Material(
            shadowColor: Colors.black,
              elevation: ss.width * .32,
              child:
          Container(
          width: ss.width * .45,
          height: ss.width * .65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
            decoration: BoxDecoration(
            color: Colors.blueGrey[900],
                borderRadius: BorderRadius.circular(ss.width*.04)),
                  width: ss.width * .45,
                  height: ss.width * .65,
            child:
            Stack(children:[
              Padding(
            padding:EdgeInsets.symmetric(horizontal:ss.width*.025 ),
            child:
              ClipRRect(
                borderRadius: BorderRadius.circular(ss.width*.03),
                  child:
              Image.asset(
                  coffee_types_data[widget.coffee_type][coffee_lv_idx]["image_data"],
                  width: ss.width * .4,
                  height: ss.width * .4,
                  fit: BoxFit.contain,
              ))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[900],
                        borderRadius: BorderRadius.circular(ss.width*.03)
                      ),
                      width: ss.width * .14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Icon(Icons.star,
                            size: ss.width * .04,
                            color: Colors.deepOrange
                      ),
                      Text(coffee_types_data[widget.coffee_type][coffee_lv_idx]["rating"],
                            style: TextStyle(fontSize: ss.width*.04))
                    ],),
                    )
                  ],),

                Container(height: ss.width * .25,
                    child:Column(children: [
                      Text(coffee_types_data[widget.coffee_type][coffee_lv_idx]["main_name"]),
                      Text(coffee_types_data[widget.coffee_type][coffee_lv_idx]["secondary_text"],
                        style: TextStyle(fontSize: ss.width*.03, fontWeight: FontWeight.w300),
                      ),
                      Stack(children:[
                        Padding(
                            padding:EdgeInsets.only(top:ss.width*.02, left:ss.width*.02),
                            child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.monetization_on_outlined,
                                size: ss.width*.03,
                            color: Colors.grey[500],
                          ),
                          Text("  "+coffee_types_data[widget.coffee_type][coffee_lv_idx]["price"]),
                        ],)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:EdgeInsets.only(top:ss.width*.02, right: ss.width*.02),
                              child:
                              InkWell(
                                onTap:(){print("tap");},
                                  child:Container(
                                      width: ss.width*.05,
                                      height: ss.width*.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(ss.width*.01),
                                            color: Colors.deepOrange),
                                      child:
                              Icon(Icons.add,
                                  size: ss.width*.04
                              ))))
                      ])
                      ])

                    ],)
                )
              ])
            ])),


            ],)

          )))   );

          }
      )
  );
  }
}
