import 'package:flutter/material.dart';

class SignAp extends StatefulWidget {
  const SignAp({Key? key}) : super(key: key);

  @override
  State<SignAp> createState() => _SignApState();
}

class _SignApState extends State<SignAp> {
  final _nameContorller = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _againpasswordController = TextEditingController();
  final _numberphoneController = TextEditingController();
  @override
  void dispose() {
    _nameContorller.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _againpasswordController.dispose();
    _numberphoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Ap'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(children: [
          TextFormField(
            controller: _nameContorller,
            decoration: InputDecoration(
              labelText: 'Name',
              suffixIcon: Icon(Icons.delete_outline),
            ),
          ),
          TextFormField(
            controller: _secondNameController,
            decoration: InputDecoration(
                labelText: 'Second name',
                suffixIcon: Icon(Icons.delete_outline)),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: Icon(Icons.delete_outline)),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                labelText: 'password',
                suffixIcon: Icon(Icons.delete_outline)),
          ),
          TextFormField(
            controller: _againpasswordController,
            decoration: InputDecoration(
                labelText: 'try again',
                suffixIcon: Icon(Icons.delete_outline)),
          ),
          TextFormField(
            controller: _numberphoneController,
            decoration: InputDecoration(
                labelText: 'Number phone',
                suffixIcon: Icon(Icons.delete_outline)),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Sign up'))
        ]),
      ),
    );
  }
}
