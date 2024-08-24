import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_fireship/firebase_options.dart';
import 'package:quiz_fireship/home/home.dart';
import 'package:quiz_fireship/routes/router.dart';
import 'package:quiz_fireship/services/firestore.dart';
import 'package:quiz_fireship/services/models.dart';
import 'package:quiz_fireship/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) => FirestoreService().streamReport(),
      initialData: Report(),
      child: MaterialApp(
        title: 'Quiz App',
        theme: appTheme,
        routes: appRoutes,
      ),
    );
  }
}
