import 'package:bloc/bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_events.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_states.dart';
import 'package:todo/domain/usecase/login_use_case_SignUp.dart';

class SignUpBloc extends Bloc<UserEvent, UserState> {
  LoginUseCaseRegistration signUpUseCase;
  SignUpBloc({ required this.signUpUseCase}) : super(UserLoadedState()) {
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



