import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz_fireship/quiz/quiz_screen.dart';
import 'package:quiz_fireship/quiz/quiz_state.dart';
import 'package:quiz_fireship/services/firestore.dart';
import 'package:quiz_fireship/services/models.dart';
import 'package:quiz_fireship/shared/animated_progress_bar.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.quizId});
  final String quizId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);

          if (!snapshot.hasData || snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var quiz = snapshot.data;

            if (quiz == null) {
              return Center(child: Text('Quiz not found'));
            }

            return Scaffold(
              appBar: AppBar(
                title: AnimatedProgressbar(value: state.progress),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(FontAwesomeIcons.times)),
              ),
            );
          }
        },
      ),
    );
  }
}
