import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:academia_rost/widgets/get_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../model/entity/student_entity/mark_entites/mark_with_day_entity.dart';
import '../circular_widget/circular_day_widget.dart';

class MarkWithDayFuture extends StatefulWidget {
  const MarkWithDayFuture({Key? key}) : super(key: key);

  @override
  State<MarkWithDayFuture> createState() => _MarkWithDayFutureState();
}

class _MarkWithDayFutureState extends State<MarkWithDayFuture> {
  late Future<List<MarkWithDayEntity>?>? markWithDayFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markWithDayFuture = ApiClientHttp().loadMarkWithDay();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: markWithDayFuture,
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
                          child: ShowStaticWithDayWidget(snapshot.data
                                  ?.elementAt(
                                      (snapshot.data?.length)! - index - 1) ??
                              MarkWithDayEntity()),
                        );
                      },
                    ),
                  ),
                ),
                GetRow.getCorrectAndWrongInfo(),
              ],
            );
          } else if (snapshot.hasError) {
            return SizedBox(
              height: 60.h,
              child: const Center(
                child: Text(StaticVariable.errorFuture),
              ),
            );
          }
          return SizedBox(
              height: 60.h,
              child: const Center(child: CircularProgressIndicator()));
        });
  }
}
