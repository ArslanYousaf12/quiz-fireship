import 'package:flutter/material.dart';
import 'package:quiz_fireship/services/models.dart';
import 'package:quiz_fireship/shared/animated_progress_bar.dart';
import 'package:quiz_fireship/topics/topic_detail_screen.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: topic.img,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TopicDetailScreen(topic: topic);
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/covers/${topic.img}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      topic.title,
                      style: const TextStyle(
                          height: 1.5, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
                TopicProgress(topic: topic)
              ],
            ),
          ),
        ));
  }
}
