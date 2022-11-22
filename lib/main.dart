import 'package:flutter/material.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_bloc.dart';
import 'package:todo/presentation/Sign_up.dart';
import 'package:todo/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpBloc(useCase: ), // Репозиторий + usecase
        )
      ],
      child: MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
