import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architect/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../repository/auth/login_reppository.dart';
part 'login_event.dart';
part 'login_states.dart';
// super mean pass initial state of the login which can we provided
class LoginBloc extends Bloc<LoginEvents,LoginState>{
   LoginRepository loginRepository=LoginRepository();
  LoginBloc():super(const LoginState()){
    on<EmailChange>(_onEmailChanged);
    on<PasswordChange>(_onPasswordChange);
    on<LoginApi>(_loginApi);

  }
  void _onEmailChanged(EmailChange event,Emitter<LoginState>emit){
    emit(state.CopyWith(email: event.email));
  }
  void _onPasswordChange(PasswordChange event,Emitter<LoginState>emit){
    emit(state.CopyWith(password: event.password

    ));
  }
  void _loginApi(LoginApi event,Emitter<LoginState>emit)async{
    Map data={"email":state.email,"password": state.password};
    emit(state.CopyWith(postApiStatus: PostApiStatus.loading));
    //Map data={"email":"eve.holt@reqres.in","password": "cityslicka"};
    print(state.email);
    print(state.password);
   await loginRepository.loginApi(data).then((value){
  if(value.error.isNotEmpty){
    emit (state.CopyWith(message: value.toString(),postApiStatus: PostApiStatus.error));


  }else{
    emit(state.CopyWith(message: value.token,postApiStatus: PostApiStatus.success));

    emit(state.CopyWith(message: 'Login Successful',postApiStatus: PostApiStatus.success));
  }

    }).onError((error, stackTrace){
     emit (state.CopyWith(message: error.toString(),postApiStatus: PostApiStatus.error));
     //print( error);
   });


  }

}