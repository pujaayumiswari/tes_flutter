import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginForm(),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman pendaftaran
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Don't have an account? Register here"),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

      // Perform login logic here (e.g., authenticate user)
      print('Email: $email');
      print('Password: $password');
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
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
