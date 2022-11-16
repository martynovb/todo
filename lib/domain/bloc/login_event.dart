import '../base/base_event.dart';

class LoginEvent extends BaseEvent {
  String email;
  String password;

  LoginEvent(this.email, this.password);
}

class LoginWithGoogle extends BaseEvent {}
