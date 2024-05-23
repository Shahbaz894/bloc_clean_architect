import 'package:bloc_clean_architect/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPasswordWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const InputPasswordWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
        buildWhen: (current,previous)=> current.password != previous.password,
        builder: (context,state){
      return TextFormField(
        keyboardType: TextInputType.text,
        focusNode: passwordFocusNode,
        obscureText: true,
        decoration: const InputDecoration(hintText:'Password',border: OutlineInputBorder(),

        ),
        onChanged: (value){
          context.read<LoginBloc>().add(PasswordChange(password: value));
        },
        validator: (value){
          if(value!.isEmpty){

            return "Enter password";
          }
          if(value.length<6){
            return 'please enter password length greater than 6';
          }
          return null;
        },
        onFieldSubmitted: (value){},
      );
    });
  }
}
