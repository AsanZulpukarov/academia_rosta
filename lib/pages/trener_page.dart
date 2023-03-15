import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/trainer_widgets/characterShowVal_widget.dart';
import '../widgets/trainer_widgets/expansionTile_widget.dart';
import '../widgets/trainer_widgets/showRandomVal_widget.dart';

class TrainerPage extends StatelessWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ShowRandomValWidget(),
        CharacterShowValWidget(),
        ExpansionTileWidget(),
      ],
    );
  }
}
