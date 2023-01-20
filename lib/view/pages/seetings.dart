import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../view_model/cubit_color/color_cubit.dart';
import '../utilities/style/colors.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ColorCubit cubit =ColorCubit.get(context);
    return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Column(
            children: [
              Text("theme Mode", style: TextStyle(
                  fontSize: 30
              ),),
              Switch(
                  activeColor: AppTheme.pinkColor,
                  value: !cubit.isDarkTheme,
                  onChanged: (value) {
                    cubit.changeAppTheme();
                  })
            ],
          ),
        );
      }
}
