import 'package:bloc/bloc.dart';

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

/// events
abstract class UserEvent {}

class SignUpEvent extends UserEvent {
  final String email;
  final String userName;
  final String password;

  SignUpEvent({required this.userName, required this.email, required this.password});

}

/// states
abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {}

class UserCreatedState extends UserState {}

class UserErrorState extends UserState {}
