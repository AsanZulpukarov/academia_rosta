import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../model/entity/student_entity/mark_entites/mark_with_topic_entity.dart';
import '../circular_widget/circular_topic_widget.dart';

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
            return SizedBox(
              height: 180.h,
              child: ListView.builder(
                addAutomaticKeepAlives: false,
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 180.w,
                    child: ShowStaticWithTopicWidget(
                        snapshot.data?.elementAt(index) ??
                            MarkWithTopicEntity()),
                  );
                },
              ),
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
