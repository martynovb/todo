import 'package:flutter/material.dart';

import 'package:todo/presentation/Sign_up.dart';

import '../domain/base/base_state.dart';
import '../domain/bloc/login_bloc.dart';
import '../domain/bloc/login_event.dart';
import '../domain/bloc/login_state.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


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
                    onSaved: (value) => LoginEvent("",value as String, "","") ,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.delete_outline),
                    ),
                    keyboardType: TextInputType.multiline,
                    onSaved: (value) => LoginEvent("","",value as String,""),
                    validator: (val) =>
                    val!.isEmpty
                        ? 'Name is required'
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
                        builder: (context) => SignAp());
                    Navigator.push(context, route);
                  }, child: Text('Sign Up screen'))
                ],
              ),
            ),
      );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _bloc.inputEventSink.add(
          LoginEvent("", _emailController.text, _passwordController.text,"" ));
    } else
      print('Form is not valid ');
  }

}
