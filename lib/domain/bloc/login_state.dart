import '../base/base_state.dart';

class LoginResultState extends BaseState{
  bool result;
  String? errorMessage;
  LoginResultState(this.result, [this.errorMessage]);
}