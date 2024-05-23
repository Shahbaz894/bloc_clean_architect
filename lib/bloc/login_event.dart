part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable{
  @override
  List<Object> get props=>[];
}

class EmailChange extends LoginEvents{
  final String email;
  EmailChange({required this.email});
  @override
  List<Object> get props=>[email];

}
class EmailUnFocused extends LoginEvents{

}

class PasswordChange extends LoginEvents{
  final String password;
  PasswordChange({required this.password});
  @override
  List<Object> get props=>[password];

}
class PasswordUnFocused extends LoginEvents{}
class LoginApi extends LoginEvents{}