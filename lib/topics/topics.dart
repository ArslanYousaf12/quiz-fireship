import 'package:flutter/material.dart';
import 'package:quiz_fireship/shared/bottom_navigation_bar.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBarQuiz(),
    );
  }
}
