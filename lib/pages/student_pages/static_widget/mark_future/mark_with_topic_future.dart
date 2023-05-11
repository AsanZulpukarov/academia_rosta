import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:flutter/material.dart';

import '../../../../model/entity/student_entity/mark_entites/mark_with_topic_entity.dart';

class MarkWithTopicFuture extends StatefulWidget {
  const MarkWithTopicFuture({Key? key}) : super(key: key);

  @override
  State<MarkWithTopicFuture> createState() => _MarkWithTopicFutureState();
}

class _MarkWithTopicFutureState extends State<MarkWithTopicFuture> {
  late Future<List<MarkWithTopicEntity>?>? markWithTopicFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markWithTopicFuture = ApiClientHttp().loadMarkWithTopic();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: markWithTopicFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container();
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(StaticVariable.errorFuture),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
