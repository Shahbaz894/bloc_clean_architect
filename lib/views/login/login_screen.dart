import 'package:bloc_clean_architect/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final emailFocusNode=FocusNode();
  final passwordFocusNode=FocusNode();
  final _formKey=GlobalKey<FormState>();
  @override
  void initState(){
    loginBloc=LoginBloc();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BlocProvider(
        create:(_)=>loginBloc ,
        child:
        Form(
            key: _formKey,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputWidget(emailFocusNode: emailFocusNode),

                SizedBox(height: 20,),
                InputPasswordWidget(passwordFocusNode: passwordFocusNode),

                 const SizedBox(height: 20,),
                const LoginButton(),




              ],)),

      )

    );
  }
}
