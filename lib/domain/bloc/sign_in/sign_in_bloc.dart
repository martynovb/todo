import 'package:todo/domain/bloc/sign_in/sign_in_events.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_state.dart';


import 'package:bloc/bloc.dart';

class SignInBloc extends Bloc<UserEvent,UserState>{
  var signInUseCase;
  var loginWithGoogleUseCase;
  SignInBloc() : super (UserLoadedState() ){
    on<SignInEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final result = signInUseCase.execute(event.email, event.password);
        result ? emit( UserCreatedState()) : emit(UserErrorState());
      } catch (_) {
        emit(UserErrorState());
      }
    },
    );
    on<SignWithGoogle>((event, emit) async {
      emit(UserLoadingState());
      try {
        final result = loginWithGoogleUseCase;
        result ? emit( UserCreatedState()) : emit(UserErrorState());
      } catch (_) {
        emit(UserErrorState());
      }
    });
  }


}







