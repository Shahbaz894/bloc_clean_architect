part of 'login_bloc.dart';
//we have only two state one is password and other is email
class LoginState extends Equatable{
  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;
  const LoginState( {
    this.postApiStatus=PostApiStatus.initial,
    this.email='',
    this.message='',
    this.password=''

});
  LoginState CopyWith({
    PostApiStatus? postApiStatus,
    String ?email,
    String?password,
    String?message,

}){
    return LoginState(
    postApiStatus: postApiStatus?? this.postApiStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      message:message?? this.message
    );
  }
  @override
  List<Object> get props => [email,password,postApiStatus,message];
}
