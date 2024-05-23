import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashBarHelper{
static void flushBarErrorMessage(String message,BuildContext context){
  showFlushbar(
      context: context,
      flushbar: Flushbar(

        duration: Duration(seconds: 2),
    forwardAnimationCurve: Curves.decelerate,
    margin:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    padding: EdgeInsets.all(14),
    borderRadius: BorderRadius.circular(15),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.green,
    reverseAnimationCurve: Curves.decelerate,
    positionOffset: 20,
    icon: const Icon(
      Icons.error,
      size: 20,
      color: Colors.white,
    ),

    message: message,
    
  )..show(context)
  
  );
}
}