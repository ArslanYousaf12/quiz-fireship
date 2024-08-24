import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_fireship/services/auth_service.dart';
import 'package:quiz_fireship/services/models.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().user;
    final report = Provider.of<Report>(context);
    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.displayName ?? 'Guest'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.photoURL ?? ''),
                    ),
                  ),
                ),
              ),
              Text(
                user.email ?? 'No email',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              Text(
                'Total Points: ${report.total}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Quiz Completed',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  final authService = AuthService();
                  authService.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: const Text('Sign Out'),
              ),
              Spacer()
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                final authService = AuthService();
                authService.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 25),
                ),
              )),
        ),
      );
    }
  }
}
