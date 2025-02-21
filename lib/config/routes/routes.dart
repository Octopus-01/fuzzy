
import 'package:flutter/material.dart';
import 'package:login/config/routes/routs_name.dart';
import '../../Screens/login/LoginScreen.dart';
import '../../Screens/splash/SplashScreen.dart';


class Routs{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen : return MaterialPageRoute(builder: (_) => Splashscreen());
      case RoutesName.LoginScreen : return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(child: Text("No Routs Available")),
          );
        });
    }
  }
}