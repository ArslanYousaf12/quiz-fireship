// import 'package:flutter/material.dart';
// import 'package:quiz_fireship/shared/animated_progress_bar.dart';

// class QuizScreen extends StatelessWidget {
//   const QuizScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: AnimatedProgressbar(value: state.progress),
//         leading: IconButton(
//           icon: const Icon(FontAwesomeIcons.xmark),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: PageView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         controller: state.controller,
//         onPageChanged: (int idx) =>
//             state.progress = (idx / (quiz.questions.length + 1)),
//         itemBuilder: (BuildContext context, int idx) {
//           if (idx == 0) {
//             return StartPage(quiz: quiz);
//           } else if (idx == quiz.questions.length + 1) {
//             return CongratsPage(quiz: quiz);
//           } else {
//             return QuestionPage(question: quiz.questions[idx - 1]);
//           }
//         },
//       ),
//     );
//   }
// }
