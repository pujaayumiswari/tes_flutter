import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      // Perform registration logic here
      print('Registering with Email: $email');
      print('Registering with Password: $password');
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      // Email validation pattern
      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      }
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) => _validateEmail(value),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            validator: (value) => _validatePassword(value),
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
