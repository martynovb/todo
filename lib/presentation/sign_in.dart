import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
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
  late final NavigatorBloc _navigatorBloc;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    _signInBloc = BlocProvider.of<SignInBloc>(context);
    _navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Sign IN',
            style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.normal,
                color: Colors.lightBlue.shade900),
          ),
        ),
        body: BlocBuilder(
            bloc: _signInBloc,
            builder: (context, state) {
              if (state is UserLoadedState) {
                return Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(20.0),
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            suffixIcon: Icon(Icons.delete_outline)),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) =>
                            val!.isEmpty ? 'Name is required' : null,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.delete_outline),
                        ),
                        keyboardType: TextInputType.multiline,
                        validator: (val) =>
                            val!.isEmpty ? 'Please check password' : null,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.blue.shade900))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow.shade600),
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text('Sign in',
                            style: TextStyle(
                                fontSize: 18,

                                color: Colors.black,
                                fontStyle: FontStyle.italic)
                        ),
                      ),
                      SizedBox(height: 8,),
                      Row(children: [
                        Text('Do not have an account?'),
                        Container(
                          padding: EdgeInsets.all(15),
                          child:
                          ElevatedButton(onPressed: () {
                            _buttonSignUp();
                          },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white),
                            child:  Text('Sign UP ', style: TextStyle( color: Colors.blue.shade900,)),)
                          ,
                        ),
                      ],)
                    ],
                  ),
                );
              } else if (state is UserLoadingState) {
                return _loadingIndicator();
              } else if (state is UserErrorState) {
                return const Center(
                  child: Text('Error'),
                );
              } else if (state is UserLoadedState) {
                Navigator.pushNamed(context, 'HomePage');
                return const Center(
                  child: Text('NONE'),
                );

              } else if (state is UserGoToSignUpState) {
                Navigator.pushNamed(context, '/sign_up');
                return const Center(
                  child: Text('NONE'),
                );
              } else {
                return const Center(
                  child: Text("None"),
                );
              }
            }));
  }

  Widget _loadingIndicator() {
    return Center(child: Text('Loading...'));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _signInBloc
          .add(SignInEvent(_emailController.text, _passwordController.text));
    } else
      print('Form is not valid ');
  }
 void _buttonSignUp(){
    _signInBloc.add(SignUpEvent());
 }
}
