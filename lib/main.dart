import 'package:flutter/material.dart';
import 'package:todo/data/repo/auth_repository.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_bloc.dart';
import 'package:todo/domain/usecase/sign_up_use_case.dart';
import 'package:todo/presentation/Sign_up.dart';
import 'package:todo/presentation/home_page.dart';
import 'package:todo/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repo/auth_repository_impl.dart';
import 'domain/bloc/sign_in/sign_in_bloc.dart';
import 'domain/usecase/sign_in_use_case.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavigatorBloc(_navigatorKey),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignUpBloc(
                signUpUseCase: SignUpUseCase(
                  authRepository: AuthRepositoryImpl(),
                ),
              ), // Репозиторий + usecase
            ),
            BlocProvider(
                create: (context) => SignInBloc(
                      navigatorBloc: BlocProvider.of<NavigatorBloc>(context),
                      signInUseCase: SignInUseCase(AuthRepositoryImpl()),
                    ))
          ],
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            routes: appRouter,
            home: SignIn(),
          ),
        ));
  }
}
