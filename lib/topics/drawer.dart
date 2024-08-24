import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz_fireship/services/models.dart';
import 'package:quiz_fireship/topics/topics.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.topics});
  final List<Topic> topics;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final topic = topics[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
                QuizList(topic: topic),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: topics.length),
    );
  }
}

class QuizList extends StatelessWidget {
  const QuizList({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: topic.quizzes.map((quiz) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.all(4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(quiz.title),
              subtitle: Text(quiz.description),
              leading: QuizBadge(topic: topic, quizId: quiz.id),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class QuizBadge extends StatelessWidget {
  const QuizBadge({super.key, required this.topic, required this.quizId});
  final Topic topic;
  final String quizId;

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);

    List completed = report.topics[topic.id] ?? [];
    if (completed.contains(quizId)) {
      return const Icon(FontAwesomeIcons.checkDouble, color: Colors.green);
    } else {
      return const Icon(FontAwesomeIcons.solidCircle, color: Colors.grey);
    }
  }
}
