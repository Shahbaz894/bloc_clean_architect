import 'package:bloc_clean_architect/bloc/login_bloc.dart';
import 'package:bloc_clean_architect/config/routes/routes.dart';
import 'package:bloc_clean_architect/config/routes/routes_name.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=> LoginBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute:RoutesName.loginScreen ,
        onGenerateRoute: Routes.generateroutes,
      ),
    );
  }
}


