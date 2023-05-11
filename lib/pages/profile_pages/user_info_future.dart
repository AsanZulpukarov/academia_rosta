import 'package:flutter/material.dart';

import '../../model/entity/user_info.dart';
import '../../model/static_variable/static_variable.dart';
import '../../service/api_service/api_client.dart';
import '../../widgets/get_row_text_widget.dart';

class UserInfoFuture extends StatefulWidget {
  const UserInfoFuture({Key? key}) : super(key: key);

  @override
  State<UserInfoFuture> createState() => _UserInfoFutureState();
}

class _UserInfoFutureState extends State<UserInfoFuture> {
  late Future<UserInfo> userInfoFuture;
  late final Map<String, String> userInfo;
  ProfileInfoWidget({key}) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfoFuture = ApiClientHttp().loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    UserInfo? user;
    return FutureBuilder(
      future: userInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text(StaticVariable.errorFuture));
        }
        if (snapshot.hasData) {
          user = snapshot.data!;
          var userInfo = {
            'ФИО:': '${user?.lastname} ${user?.firstname}',
            'Возраст:': '${user?.age}',
            'Логин:': '${user?.username}',
            'Тел номер:': '${user?.phoneNumber}',
            'Адрес:': '${user?.address}'
          };
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: userInfo.entries.map((entry) {
                return GetRowText.getText(entry.key, entry.value);
              }).toList(),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
