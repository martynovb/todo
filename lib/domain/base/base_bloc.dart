import 'package:bloc_provider/bloc_provider.dart';
import 'package:todo/data/repo/auth_repository.dart';
import 'package:todo/domain/base/base_event.dart';
import 'package:todo/domain/base/base_state.dart';

import '../usecase/login_use_case.dart';

class UserBloc extends Bloc<UserEvent, UserState >{
  late final LoginUseCase loginUseCase;
  @override
  void dispose() {
  }
UserBloc({required this.loginUseCase}): super (UserEmptyState()){
    on<SignUp> ((event, emit) => async {
      emit(UserLoadingState());

      try{
         // final loadingDataRepository = await loginUseCase.AuthRepository(); ??
    } catch (_){
        emit(UserErrorState());
    }
    });
}

}