import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_fireship/services/auth_service.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                color: const Color.fromRGBO(156, 39, 176, 1),
                text: 'Continue as Guest',
                icon: FontAwesomeIcons.userNinja,
                onPressed: () {
                  final authService = AuthService();
                  authService.anonySignIn();
                },
              ),
            ),
            Flexible(
              child: LoginButton(
                color: const Color.fromRGBO(33, 150, 243, 1),
                text: 'Sign in with Google',
                icon: FontAwesomeIcons.google,
                onPressed: () {
                  final authService = AuthService();
                  authService.googleSignIn();
                },
              ),
            ),
            Flexible(
              child: LoginButton(
                color: const Color.fromRGBO(0, 0, 0, 1),
                text: 'Sign in with Apple',
                icon: FontAwesomeIcons.apple,
                onPressed: () {
                  final authService = AuthService();
                  authService.signInWithApple();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final String text;
  void Function()? onPressed;
  final IconData icon;
  LoginButton(
      {super.key,
      required this.color,
      required this.text,
      this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
