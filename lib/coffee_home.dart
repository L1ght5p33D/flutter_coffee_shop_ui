import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:coffee_shop_ui/coffee_type_LV.dart';

List coffee_types_list = ["Cappuccino","Espresso", "Latte", "Flat White"];
List coffee_types_data_names = ["cappuccino", "espresso", "latte", "flat_white"];

class CoffeeShopHome extends StatefulWidget {
  const CoffeeShopHome({super.key});


  @override
  State<CoffeeShopHome> createState() => _CoffeeShopHomeState();
}

class _CoffeeShopHomeState extends State<CoffeeShopHome> {
int _bnb_selected_idx = 0;
  ScrollController _scrollController = ScrollController();
int coffee_type_chosen_idx=0;

  @override
  Widget build(BuildContext context) {

    Size ss = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bnb_selected_idx, //New
        onTap: (index){setState(() {
          _bnb_selected_idx = index;
        });},
        items: [
          BottomNavigationBarItem(
              label: "",
              icon:
          Icon(Icons.home),
          activeIcon: Icon(Icons.home, color: Colors.deepOrange,)
          ),
          BottomNavigationBarItem(
              label:"",
              icon:
          Icon(Icons.favorite ),
          activeIcon: Icon(Icons.favorite, color: Colors.deepOrange,)),
          BottomNavigationBarItem(
              label:"",
              icon:
          Icon(Icons.notifications_rounded ),
              activeIcon: Icon(Icons.notifications_rounded, color: Colors.deepOrange,))
        ],
      ),
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
                  Stack(children:[
            ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
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
                      width: ss.width * .27,
                      height: ss.width * .15,
                      child:Stack(
                          // mainAxisSize: MainAxisSize.min,
                          children:[
                    InkWell(
                        onTap:(){
                          if (coffee_type_idx ==0 ) {
                            _scrollController.animateTo(0.0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOut);
                          }
                          if (coffee_type_idx ==1 ) {
                            _scrollController.animateTo(ss.width*.04,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOut);
                          }
                          if (coffee_type_idx ==2 ){
                            _scrollController.animateTo(ss.width*.11,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOut);

                          }
                          if (coffee_type_idx ==3 ){
                            _scrollController.animateTo(ss.width*.60,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOut);

                          }
                          setState(() {
                            coffee_type_chosen_idx = coffee_type_idx;
                          });

                        },
                        child:
                    Container(
                      width: ss.width * .27,
                      height:ss.width * .15,
                      child:Center(child:
                      Text(coffee_types_list[coffee_type_idx],
                            style: TextStyle(color: itemtextcolor),
                      )))
                    ),

                            //     item_is_chosen ?
                  //     Container(
                  //     width: ss.width * .25,
                  // height:ss.width * .15,
                  // padding:EdgeInsets.only(top:ss.width*.08),
                  // child:Center(child:
                  //         Text("•",
                  //         style: TextStyle(fontSize: ss.width*.1,
                  //                           color: itemtextcolor),))):
                  //     Container()

                      ]));
            }),
                    Padding(
                      padding:EdgeInsets.only(left:ss.width*.15,
                                              top:ss.width*.13),
                    child:
                    AnimatedSmoothIndicator(
                      activeIndex: coffee_type_chosen_idx,
                      count:  4,
                      axisDirection: Axis.horizontal,
                      effect:  SlideEffect(
                        spacing:  ss.width*.19,
                          radius:  4.0,
                          dotWidth:  5.0,
                          dotHeight:  5.0,
                          paintStyle:  PaintingStyle.stroke,
                          strokeWidth:  1.5,
                          dotColor:  Colors.transparent,
                          activeDotColor:  Colors.deepOrange
                      ),
                    )),

          ])),




            Coffee_Type_LV(coffee_type: coffee_types_data_names[coffee_type_chosen_idx],),
            Padding(padding: EdgeInsets.all(ss.width*.03),
                child:
            Text("Special For you")),


              Padding(
                  padding: EdgeInsets.all(ss.width*.02),
                  child:Container(

                      height: ss.height * .2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ss.width*.05),
                        color: Colors.black26,
                      ),
                      child: Row(children: [
                        Container(
                            height: ss.height * .2,
                            width: ss.width * .24,
                            child:ClipRRect(
                                borderRadius:
                                BorderRadius.circular(
                                    ss.width * .04),
                                child:  Image.asset("assets/images/coffee_img1.png",
                                    height: ss.height * .2,
                                    width: ss.width * .24,
                                    fit:BoxFit.fill
                                ))),
                        Container(
                            height: ss.height * .2,
                            child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          // height: ss.width * .3,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: ss.width * .5,
                                                  padding: EdgeInsets.only(left:ss.width*.02, top:ss.width*.02),
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "New Coffee Beans are a Must Try!",
                                                          style: TextStyle(fontSize: ss.width * .045,
                                                              fontWeight: FontWeight.w400)   ,
                                                          // overflow:
                                                          // TextOverflow.wrap,
                                                        ),
                                                        Text(
                                                            "New beans in stock",
                                                            style: TextStyle(fontSize: ss.width * .04,
                                                                fontWeight: FontWeight.w300)
                                                        ),
                                                      ])),
                                              Container(
                                                  padding: EdgeInsets.only(top:ss.width*.2),
                                                  // width: ss.width * .15,
                                                  child: Column(children: [
                                                    Text("\$" +
                                                       "9.99",
                                                      style: TextStyle(
                                                          fontSize: ss.width * .03,
                                                          fontWeight: FontWeight.w600),
                                                    ),

                                                  ]))
                                            ],)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                          width: ss.width * .6,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding:EdgeInsets.all(ss.width*.01),
                                                    child:RatingWidget(
                                                        num_stars:
                                                       5)),
                                                // Padding(
                                                //     padding:EdgeInsets.all(ss.width*.01),
                                                //     child:TimesWidget(
                                                //         times_list:
                                                //         widget.pdest["activities"]
                                                //         [activities_idx]
                                                //         ["times_list"]))
                                              ])),
                                    ],
                                  )
                                ]))
                      ])))








          ],
        ))),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  RatingWidget({Key? key, this.num_stars: 0}) : super(key: key);
  int num_stars;

  @override
  Widget build(BuildContext context) {

    var ss = MediaQuery.of(context).size;
    List<Widget> build_stars = [];

    int bsidx = 0;
    while (bsidx < num_stars) {
      build_stars.add(Container(child: Icon(Icons.star, color:Colors.yellow[700], size:ss.width * .05)));
      bsidx += 1;
    }
    return Row(
      children: build_stars,
    );
  }
}