import 'package:bloc/bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_events.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_states.dart';

class SignUpBloc extends Bloc<UserEvent, UserState> {
  var signUpUseCase;
  SignUpBloc() : super(UserLoadedState()) {
    on<SignUpEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final result = signUpUseCase.execute(event.userName, event.email, event.password);
        result ? emit(UserCreatedState()) : emit(UserErrorState());
      } catch (_) {
        emit(UserErrorState());
      }
    });
  }
}



