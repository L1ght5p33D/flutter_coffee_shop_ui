import 'package:flutter/material.dart';
import 'package:coffee_shop_ui/coffee_type_LV.dart';

List coffee_types_list = ["Cappuccino","Espresso", "Latte", "Flat White"];
List coffee_types_data_names = ["cappuccino", "espresso", "latte", "flat_white"];

class CoffeeShopHome extends StatefulWidget {
  const CoffeeShopHome({super.key});


  @override
  State<CoffeeShopHome> createState() => _CoffeeShopHomeState();
}

class _CoffeeShopHomeState extends State<CoffeeShopHome> {

int coffee_type_chosen_idx=0;

  @override
  Widget build(BuildContext context) {

    Size ss = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child:
        Padding(
            padding: EdgeInsets.all(ss.width*.03),
            child:Container(
            height: ss.height - ss.width * .06,
            child: ListView(
          children: <Widget>[
            Container(
            height: ss.width * .13,
            child:
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
                   onPressed: (){},
                   padding: EdgeInsets.all(ss.width*.02),
                   splashRadius: ss.width * .2,
                   icon: Icon(Icons.view_array_outlined,
                       color: Colors.grey[500],
                        size: ss.width*.06,
                   ),

                  )),

              ClipRRect(borderRadius: BorderRadius.circular(ss.width * .06),
              child:Image.asset("assets/images/profile_avatar.png",
                  width: ss.width*.12,
                  height: ss.width * .12,
                  fit:BoxFit.contain)
              )

            ],)),
                  Padding(padding: EdgeInsets.all(ss.width*.02),),
            Container(
                // height: ss.width * .18,
                child:
            Text("Find your favorite coffee drinks",
            style:TextStyle(fontSize: ss.width * .11))),

                  Padding(padding: EdgeInsets.all(ss.width*.02),),

                Container(
                    padding: EdgeInsets.all(ss.width*.02),
                    width: ss.width*.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ss.width * .08),
                      color:Colors.grey[900],
                    ),
                    child:Row(children:[
                  Icon(Icons.search,
                  size: ss.width * .045,
                      color: Colors.grey[700]),
                    Container(
                        width: ss.width*.8,
                  child:TextField(decoration: InputDecoration(
                    fillColor: Colors.blueGrey[900],
                      border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: '  Find Coffee',
                    hintStyle: TextStyle(color: Colors.grey[700])

                  )),  )
                ])
            ),
          Container(
              height: ss.width * .25,
              child:
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffee_types_list.length,
                itemBuilder: (context, coffee_type_idx){
                  Color itemtextcolor = Colors.grey;
                  bool item_is_chosen = false;
                  if (coffee_type_chosen_idx == coffee_type_idx){
                    itemtextcolor = Colors.deepOrange;
                    item_is_chosen = true;
                  }
                  return
                  Container(
                      width: ss.width * .25,
                      height: ss.width * .15,
                      child:Stack(
                          // mainAxisSize: MainAxisSize.min,
                          children:[
                    InkWell(
                        onTap:(){
                          setState(() {
                            coffee_type_chosen_idx = coffee_type_idx;
                          });
                        },
                        child:
                    Container(
                      width: ss.width * .25,
                      height:ss.width * .15,
                      child:Center(child:
                      Text(coffee_types_list[coffee_type_idx],
                            style: TextStyle(color: itemtextcolor),
                      )))
                    ),
                      item_is_chosen ?
                      Container(
                      width: ss.width * .25,
                  height:ss.width * .15,
                  padding:EdgeInsets.only(top:ss.width*.08),
                  child:Center(child:
                          Text("•",
                          style: TextStyle(fontSize: ss.width*.1,
                                            color: itemtextcolor),))):
                      Container()

                      ]));
            })),

            Coffee_Type_LV(coffee_type: coffee_types_data_names[coffee_type_chosen_idx],)



          ],
        ))),
      ),
    );
  }
}