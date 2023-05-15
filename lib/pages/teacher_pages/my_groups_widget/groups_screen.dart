import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/pages/teacher_pages/my_groups_widget/my_groups_widget.dart';
import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:flutter/material.dart';

import '../../../model/entity/teacher_entity/group_entity.dart';

class GroupsScreen extends StatefulWidget {
  GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  Future<List<GroupEntity>?>? groupsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setGroupsFuture();
  }

  setGroupsFuture() {
    groupsFuture = ApiClientHttp().loadTeacherGroups();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: groupsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyGroupsWidget(
              courses: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text(StaticVariable.errorFuture));
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
