import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../model/entity/student_entity/mark_entites/mark_with_topic_entity.dart';
import '../../../../widgets/get_row_widget.dart';
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
            return Column(
              children: [
                SizedBox(
                  height: 174.h,
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 174.w,
                          child: ShowStaticWithTopicWidget(snapshot.data
                                  ?.elementAt(
                                      (snapshot.data?.length)! - index - 1) ??
                              MarkWithTopicEntity()),
                        );
                      },
                    ),
                  ),
                ),
                GetRow.getCorrectAndWrongInfo(),
              ],
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
