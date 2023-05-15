import 'package:flutter/material.dart';

import '../../model/entity/user_info.dart';
import '../../widgets/get_row_widget.dart';

class StudentInfoWidget extends StatelessWidget {
  late final Map<String, String> userInfo;
  UserInfo? user;
  StudentInfoWidget(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userInfo = {
      'ФИО:': '${user?.lastname} ${user?.firstname}',
      'Возраст:': '${user?.age}',
      'Логин:': '${user?.username}',
      'Тел номер:': '${user?.phoneNumber}',
      'Адрес:': '${user?.address}'
    };
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: userInfo.entries.map((entry) {
            return GetRow.getText(entry.key, entry.value);
          }).toList(),
        ),
      ),
    );
  }
}
