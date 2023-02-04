import 'package:flutter/material.dart';
import 'package:coffee_shop_ui/coffee_home.dart';

class CustomError extends StatelessWidget {
  CustomError({Key? key, this.errorDetails}) : super(key: key);
  FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          color: Colors.tealAccent,
          child: Center(
              child: Text(errorDetails.toString(),
                  style: TextStyle(color: Colors.black))))
    ]);
  }
}

void main() {
  runApp(CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
  ),

        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails);
          };
          return widget!;
        },
      home: const CoffeeShopHome()
    );
  }
}


