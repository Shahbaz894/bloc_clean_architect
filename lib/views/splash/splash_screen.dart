import 'package:bloc_clean_architect/config/components/internet_exception_widget.dart';
import 'package:bloc_clean_architect/config/components/loading_widget.dart';
import 'package:bloc_clean_architect/config/components/round_button.dart';
import 'package:bloc_clean_architect/config/routes/routes_name.dart';
import 'package:bloc_clean_architect/data/exceptions/app_exception.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: (){
        Navigator.pushNamed(context, RoutesName.homeScreen);

      }, child:  Column(
        children: [
          FloatingActionButton(onPressed: (){
            throw NoInternetException('No internet');
          }),

          const LoadWidget(),
          const SizedBox(height: 30,),
          RoundButton(title: 'login', onPress: (){
            print('shahbaz');
          }, height: 50, width: 350,),
          const SizedBox(height: 30,),
          const Center(child: Text('Home')),
          SizedBox(height: 20,),
          InternetExceptionWidget(onPress: () {  },)
        ],
      )),
    );
  }
}
