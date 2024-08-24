import 'package:flutter/material.dart';
import 'package:quiz_fireship/services/firestore.dart';
import 'package:quiz_fireship/shared/bottom_navigation_bar.dart';
import 'package:quiz_fireship/topics/topic_item.dart';

import 'package:quiz_fireship/topics/drawer.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('An error occurred'),
          );
        } else if (snapshot.hasData) {
          final topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Topics'),
            ),
            drawer: DrawerWidget(topics: topics),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              primary: false,
              children: topics.map((topic) {
                return TopicItem(topic: topic);
              }).toList(),
            ),
            bottomNavigationBar: const BottomNavBarQuiz(),
          );
        } else {
          return const Center(
            child: Text('No data found'),
          );
        }
      },
    );
  }
}
