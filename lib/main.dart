import 'package:flutter/material.dart';
import 'package:todo/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/bloc/login_bloc.dart';

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
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
