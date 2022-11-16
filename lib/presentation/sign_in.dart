import 'package:flutter/material.dart';
import 'package:todo/domain/bloc.dart';
import 'package:todo/domain/model_info.dart';
import 'package:todo/presentation/Sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  infoSignIn newUser = infoSignIn();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Bloc1 _bloc = Bloc1();
    return Scaffold(
      appBar: AppBar(
        title: Text('Registr Form'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _bloc.outputStateStream,
        initialData: , // ?
        builder:  (context, snapshot){
          return
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', suffixIcon: Icon(Icons.delete_outline)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => val!.isEmpty ? 'Name is required' : null,
                  onSaved: (value) => newUser.email = value,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.delete_outline),
                  ),
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) => newUser.password = value,
                  validator: (val) => val!.isEmpty ? 'Name is required' : null,
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    onPressed: () {}, child: Text('sign in with google')),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign in'),
                ),
                ElevatedButton(onPressed: () {
                  _submitForm();
                  Route route = MaterialPageRoute(builder: (context) => SignAp());
                  Navigator.push(context, route);
                }, child: Text('Sign Up screen'))
              ],
            ),
          );
        },

      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
    _formKey.currentState?.save();
    }else
      print('Form is not valid ');
  }

}
