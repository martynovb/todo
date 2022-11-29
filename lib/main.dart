import 'package:flutter/material.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_bloc.dart';
import 'package:todo/domain/usecase/login_use_case_SignUp.dart';
import 'package:todo/presentation/Sign_up.dart';
import 'package:todo/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repo/auth_repository.dart';
import 'domain/bloc/sign_in/sign_in_bloc.dart';
import 'domain/usecase/login_use_case_SignIn.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userRepository = LoginUseCase();
  final userRepositoryRegistr = LoginUseCaseRegistration();

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpBloc(signUpUseCase: userRepositoryRegistr ), // Репозиторий + usecase
        ),
        BlocProvider(
            create: (context) => SignInBloc(signInUseCase: userRepository ))
      ],
      child: MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
