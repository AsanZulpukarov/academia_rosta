import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:flutter/material.dart';

import '../../../../model/entity/student_entity/mark_entites/mark_with_day_entity.dart';

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
