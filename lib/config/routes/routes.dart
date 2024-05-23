

import 'package:bloc_clean_architect/config/routes/routes_name.dart';

import 'package:flutter/material.dart';

import '../../views/view.dart';






class Routes{
  static Route<dynamic> generateroutes(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return  MaterialPageRoute(builder:(context)=>const SplashScreen());
      case RoutesName.homeScreen:
        return  MaterialPageRoute(builder:(context)=>const HomeScreen());
      case RoutesName.loginScreen:
        return  MaterialPageRoute(builder:(context)=>const LoginScreen());
      default:return  MaterialPageRoute(builder:(context){
        return const Scaffold(
          body: Text('No Route generated'),
        );
      });
    }
  }
}