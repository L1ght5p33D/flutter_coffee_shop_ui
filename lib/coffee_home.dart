import 'package:flutter/material.dart';



class CoffeeShopHome extends StatefulWidget {
  const CoffeeShopHome({super.key});


  @override
  State<CoffeeShopHome> createState() => _CoffeeShopHomeState();
}

class _CoffeeShopHomeState extends State<CoffeeShopHome> {


  @override
  Widget build(BuildContext context) {

    var ss = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:Container(
            height: ss.height,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            ],)

          ],
        )),
      ),
    );
  }
}