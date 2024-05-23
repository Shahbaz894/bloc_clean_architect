import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bloc_clean_architect/bloc/login_bloc.dart';
import 'package:bloc_clean_architect/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/flushbar_helper.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  const LoginButton({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
   return BlocListener<LoginBloc,LoginState>(
     listenWhen: (current,previous)=>current.postApiStatus !=previous.postApiStatus,
     listener: (BuildContext context, state) {
       if(state.postApiStatus==PostApiStatus.error){
         FlashBarHelper.flushBarErrorMessage(state.message.toString(),context);


       }
       if(state.postApiStatus==PostApiStatus.success){
         FlashBarHelper.flushBarErrorMessage('Login Successful',context);


       }
       if(state.postApiStatus==PostApiStatus.initial){
         FlashBarHelper.flushBarErrorMessage('Submitting...',context);

       }

     },

     child: BlocBuilder<LoginBloc,LoginState>(
         buildWhen:  (current,previous)=>current.postApiStatus !=previous.postApiStatus,
         builder: (context,state){
         return  ElevatedButton(onPressed: (){
         if(formKey.currentState!.validate()){
           if(state.password.length<6){
             context.read<LoginBloc>().add(LoginApi());
            print('object');
           }

         };
       }, child:state.postApiStatus==PostApiStatus.loading ? const CircularProgressIndicator(color: Colors.red,) :const Text('Login'));
     }),
   );
  }
}
