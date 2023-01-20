import 'package:ecommerce22/view/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../pages/register_screen.dart';
import 'constans.dart';

class AppRouter{
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings){
    startScreen=  SplashScreen();
    switch(settings.name){
      case  AppRoute.SplashScreen:
        return MaterialPageRoute(builder: (_)=>startScreen );
      case AppRoute.registerScreen:
        return MaterialPageRoute(builder: (_)=> RegisterScreen() ,);
      default:
        return MaterialPageRoute(builder: (_)=>SplashScreen());


    }

  }
}