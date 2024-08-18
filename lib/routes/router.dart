import 'package:quiz_fireship/about/about.dart';
import 'package:quiz_fireship/home/home.dart';
import 'package:quiz_fireship/login/login.dart';
import 'package:quiz_fireship/profile/profile.dart';
import 'package:quiz_fireship/topics/topics.dart';

var appRoutes = {
  '/': (context) => const Home(),
  '/about': (context) => const About(),
  '/login': (context) => const Login(),
  '/profile': (context) => const Profile(),
  '/topics': (context) => const Topics(),
};
