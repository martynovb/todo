import '../base/base_event.dart';

class LoginEvent  {
  String UserName;
  String email;
  String password;
  String repeatPassword;

  LoginEvent( this.email,   this.password, this.repeatPassword, this.UserName);
}

class LoginWithGoogle extends BaseEvent {}
