import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/screens/login_screen.dart';
import 'package:flutter_application_2/src/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => HomeScreen(), // HomeScreen as the initial screen
        '/login': (context) => const LoginScreen(), 
        '/register': (context) => RegisterScreen(),

      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to LoginScreen
            Navigator.pushNamed(context, '/login');
          },
          child: Text('Go to Login'),
        ),
      ),
    );
  }
}
