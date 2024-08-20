import 'package:flutter/material.dart';
import 'package:quiz_fireship/services/auth_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final authService = AuthService();
              authService.signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: const Text('Sign Out')),
      ),
    );
  }
}
