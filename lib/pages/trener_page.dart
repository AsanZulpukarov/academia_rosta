import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrenerPage extends StatelessWidget {
  const TrenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _ShowRandomVal(),
        _CharacterShowVal(),
      ],
    );
  }
}

class _ShowRandomVal extends StatefulWidget {
  const _ShowRandomVal({Key? key}) : super(key: key);

  @override
  State<_ShowRandomVal> createState() => _ShowRandomValState();
}

class _ShowRandomValState extends State<_ShowRandomVal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112.w,
      height: 133.h,
      child: Column(
        children: [
          Container(
              width: 112.w,
              height: 90.h,
              alignment: Alignment.center,
              child: Text("Random")),
          SizedBox(
            width: 112.w,
            height: 42.h,
            child: TextField(
              decoration: InputDecoration(
                label: Text('Ответ'),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CharacterShowVal extends StatefulWidget {
  const _CharacterShowVal({Key? key}) : super(key: key);

  @override
  State<_CharacterShowVal> createState() => _CharacterShowValState();
}

class _CharacterShowValState extends State<_CharacterShowVal> {
  var _part = <String, bool>{"1": false, "2": true};
  bool _customTileExpanded = false;
  Widget _widgetExpansionTile() {
    return ExpansionTile(
      title: Text('Part 1'),
      trailing: Icon(
        _customTileExpanded
            ? Icons.arrow_drop_down_circle
            : Icons.arrow_drop_down,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkbox(
            //   activeColor: ThemeThisApp.borderColor,
            //   onChanged: (value) {
            //     setState(
            //       () {
            //         _part.update(
            //             "${_part.keys}", (value) => !(_part.values as bool));
            //       },
            //     );
            //   },
            //   value: null,
            // ),
            Text(
              '',
              style: TextStyle(
                fontSize: 16.sp,
                color: ThemeThisApp.fillButton,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 276.w,
            child: Column(
              children: [
                _rowTextAndIcon("Скорость", 1.01),
                _rowTextAndIcon("Разрядность", 1),
                _rowTextAndIcon("Количество переменных", 1),
              ],
            ),
          ),
          Container(
            width: 276.w,
            child: Column(
              children: [_widgetExpansionTile(), _widgetExpansionTile()],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _rowTextAndIcon(String text, double num) {
  return Container(
    width: 276.w,
    height: 32.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: ThemeThisApp.fillButton),
          ),
        ),
        Row(
          children: [
            IconButton(
              iconSize: 18.sp,
              tooltip: 'Уменьшить',
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle_outline,
                color: ThemeThisApp.borderColor,
              ),
              splashRadius: 12.r,
            ),
            Container(
              width: 26.w,
              alignment: Alignment.center,
              child: Text(
                "${num}",
                style: TextStyle(color: ThemeThisApp.fillButton),
              ),
            ),
            IconButton(
              iconSize: 18.sp,
              style: ButtonStyle(alignment: Alignment.topCenter),
              tooltip: 'Увеличить',
              splashRadius: 12.r,
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline,
                color: ThemeThisApp.borderColor,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
