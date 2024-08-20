import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_fireship/login/login.dart';
import 'package:quiz_fireship/services/auth_service.dart';
import 'package:quiz_fireship/topics/topics.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          return const Topics();
        } else {
          return const Login();
        }
      },
    );
  }
}
