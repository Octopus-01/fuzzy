import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/routes/routs_name.dart';
import '../session_manager/session_controler.dart';

class SplashServices{
  void isLogin(BuildContext context){
    SessionControler().getUserFromPreference().then((value){
      if(SessionControler().isLogin ?? false){
         Timer(const Duration(seconds:2),
        ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.DemoScree, (route) => false));
      }else{

        Timer(const Duration(seconds:2),
        ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.LoginScreen, (route) => false));
      }
    }).onError((error , stackTrace){
      Timer(const Duration(seconds:2 ),
      ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.LoginScreen, (route) => false));
    });
  }
}