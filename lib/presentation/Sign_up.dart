import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/base/base_bloc.dart';
import 'package:todo/domain/usecase/login_use_case.dart';

import '../domain/base/base_state.dart';
import '../domain/bloc/login_event.dart';

class SignAp extends StatefulWidget {
  const SignAp({Key? key}) : super(key: key);

  @override
  State<SignAp> createState() => _SignApState();
}

class _SignApState extends State<SignAp> {
  final _formKey = GlobalKey<FormState>();
  final _nameContorller = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _againpasswordController = TextEditingController();
 

  @override
  void dispose() {
    _nameContorller.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _againpasswordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context,state){
        if(state is UserLoadedState  ){
          return   Scaffold(
            appBar: AppBar(
              title: Text('Sign Ap'),
              centerTitle: true,
            ),
            body: Form(
              key: _formKey,
              child: ListView(children: [
                TextFormField(
                  controller: _nameContorller,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    suffixIcon: Icon(Icons.delete_outline
                    ),

                  ),
                  validator: (val) =>
                  val!.isEmpty
                      ? 'Name is required'
                      : null,
                  onSaved: (value) => LoginEvent(value as String,"", "",""),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.delete_outline)),
                  validator: (val) =>
                  val!.isEmpty
                      ? 'Name is required'
                      : null,
                  onSaved: (value) => LoginEvent("",value as String, "","") ,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'password',
                      suffixIcon: Icon(Icons.delete_outline)
                  ),
                  validator: (val) =>
                  val!.isEmpty
                      ? 'Name is required'
                      : null,
                  onSaved: (value) => LoginEvent("","", value as String,""),

                ),
                TextFormField(
                  controller: _againpasswordController,
                  decoration: InputDecoration(
                      labelText: 'Repeat password',
                      suffixIcon: Icon(Icons.delete_outline)),
                  validator: (val) =>
                  val!.isEmpty
                      ? 'Name is required'
                      : null,
                  onSaved: (value) => LoginEvent("","", "",value as String),
                ),

                ElevatedButton(onPressed: (){
                  _submitFormSignUp();
                }, child: Text('Sign up'))
              ]),
            ),
          );

  }else if( state is UserLoadingState){
          return _loadingIndicator();
        } else if( state is UserErrorState){
          return //???
        }
      } ;


  }
  void _submitFormSignUp(){
    if(_formKey.currentState!.validate()){
      LoginEvent("", _emailController.text, _passwordController.text,"" );
    } else
    print('Form is not valid ');
  }
    }


