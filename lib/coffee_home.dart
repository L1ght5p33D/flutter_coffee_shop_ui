import 'package:flutter/material.dart';

List coffee_types_list = ["Cappuccino","Espresso", "Latte", "Flat White"];

class CoffeeShopHome extends StatefulWidget {
  const CoffeeShopHome({super.key});


  @override
  State<CoffeeShopHome> createState() => _CoffeeShopHomeState();
}

class _CoffeeShopHomeState extends State<CoffeeShopHome> {

int coffee_type_chosen_idx=0;

  @override
  Widget build(BuildContext context) {

    var ss = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:Padding(
            padding: EdgeInsets.all(ss.width*.03),
            child:Container(
            height: ss.height,
            child: ListView(
          children: <Widget>[
            Container(
            height: ss.width * .13,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.view_array_outlined,
                    color: Colors.grey[500],
                  ),
                ),
              ClipRRect(borderRadius: BorderRadius.circular(ss.width * .06),
              child:Image.asset("assets/images/profile_avatar.png",
                  width: ss.width*.12,
                  height: ss.width * .12,
                  fit:BoxFit.contain)
              )

            ],)),

            Container(
                height: ss.width * .18,
                child:
            Text("Find your favorite coffee drinks",
            style:TextStyle(fontSize: ss.width * .15))),

            Container(
              padding: EdgeInsets.symmetric(vertical: ss.width*.03),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ss.width * .05),
              ),
                width: ss.width * .88,
                child:Row(children:[
                  Icon(Icons.search,
                  size: ss.width * .045,),
                  TextField(decoration: InputDecoration(
                      border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Find Coffee'
                  ),  )
                ])
            ),

            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, coffee_type_idx){
                  Color itemtextcolor = Colors.grey[400]!;
                  bool item_is_chosen = false;
                  if (coffee_type_chosen_idx == coffee_type_idx){
                    itemtextcolor = Colors.deepOrange;
                    item_is_chosen = true;
                  }
                  return
                  Container(
                      width: ss.width * .25,
                      height: ss.width * .15,
                      child:Column(children:[
                    InkWell(
                        onTap:(){
                          setState(() {
                            coffee_type_chosen_idx = coffee_type_idx;
                          });
                        },
                        child:
                    Container(
                      width: ss.width * .25,
                      child:Center(child:
                      Text(coffee_types_list[coffee_type_idx],
                            style: TextStyle(color: itemtextcolor),
                      )))
                    ),
                      item_is_chosen ?
                          Text(".",
                          style: TextStyle(fontSize: ss.width*.5,
                                            color: itemtextcolor),):
                      Container()

                      ]));
            })



          ],
        ))),
      ),
    );
  }
}