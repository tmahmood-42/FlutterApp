import 'package:flutter/material.dart';
import 'route_name.dart';
import 'package:english_app/screens/home.dart';
import 'package:english_app/screens/default_route.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  Home());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => DefaultRoute());
    }// Switch Statement
  }// Line 7
}