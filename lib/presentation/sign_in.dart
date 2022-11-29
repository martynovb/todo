import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_state.dart';

import 'package:todo/presentation/sign_up.dart';

import '../domain/bloc/sign_in/sign_in_events.dart';
import 'home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final SignInBloc _signInBloc;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    _signInBloc= BlocProvider.of<SignInBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _signInBloc,
      builder: (context, state) {
        if (state is UserLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Registr Form'),
              centerTitle: true,
            ),
            body:
            Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        suffixIcon: Icon(Icons.delete_outline)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                    val!.isEmpty
                        ? 'Name is required'
                        : null,

                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.delete_outline),
                    ),
                    keyboardType: TextInputType.multiline,

                    validator: (val) =>
                    val!.isEmpty
                        ? 'Please check password'
                        : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {}, child: Text('sign in with google')),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Sign in'),
                  ),
                  ElevatedButton(onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => SignUp());
                    Navigator.push(context, route);
                  }, child: Text('Sign Up screen'))
                ],
              ),
            ),
          );
        } else if (state is UserLoadingState) {
          return _loadingIndicator();
        } else if (state is UserErrorState) {
          return const Center(
            child: Text('Error'),
          );
        } else if (state is UserLoadedState) {
          Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),
          ));
          return const Center(
            child: Text('NONE'),
          );
        } else {
          return const Center(
            child: Text('NONE'),
          );
        }
      }
    );
  }
  Widget _loadingIndicator() {
    return Center(child: Text('Loading...'));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        _signInBloc.add(SignInEvent(
            _emailController.text,
            _passwordController.text
        ));
    } else
      print('Form is not valid ');
  }

}
