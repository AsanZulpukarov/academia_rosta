import 'package:academia_rost/pages/profile_pages/student_info_widget.dart';
import 'package:flutter/material.dart';

import '../../model/entity/user_info.dart';
import '../../model/static_variable/static_variable.dart';
import '../../service/api_service/api_client.dart';

class UserInfoFuture extends StatefulWidget {
  const UserInfoFuture({Key? key}) : super(key: key);

  @override
  State<UserInfoFuture> createState() => _UserInfoFutureState();
}

class _UserInfoFutureState extends State<UserInfoFuture> {
  late Future<UserInfo?> userInfoFuture;
  ProfileInfoWidget({key}) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfoFuture = ApiClientHttp().loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text(StaticVariable.errorFuture));
        }
        if (snapshot.hasData) {
          return StudentInfoWidget(snapshot.data);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
