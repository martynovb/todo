import '../base/base_event.dart';

class LoginEvent extends BaseEvent {
  String UserName;
  String email;
  String password;
  String RepeatPassword;

  LoginEvent( this.email,   this.password, this.RepeatPassword, this.UserName);
}

class LoginWithGoogle extends BaseEvent {}
