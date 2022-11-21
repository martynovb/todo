import 'dart:async';
import '../../data/repo/auth_repository.dart';
import '../base/base_event.dart';
import '../base/base_state.dart';
import '../usecase/login_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc {
  final _inputEventController = StreamController<BaseEvent>();
  late LoginUseCase _loginUseCase;

  LoginBloc() {
    _loginUseCase = LoginUseCase(AuthRepository());
    _inputEventController.stream.listen((_mapEventResponse));
  }

  StreamSink<BaseEvent> get inputEventSink => _inputEventController.sink;
  final _outputStateController = StreamController<BaseState>();

  Stream<dynamic> get outputStateStream => _outputStateController.stream;

  _mapEventResponse(BaseEvent event) {
    if (event is LoginEvent) {
      final result = _loginUseCase.execute(event.email, event.password);
      _outputStateController.add(LoginResultState(result));
    } // ?
    else if (event is LoginWithGoogle) {
      return true;
    } else {
      throw Exception('Wrong event');
    }
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}

abstract class BlocEvent {}



