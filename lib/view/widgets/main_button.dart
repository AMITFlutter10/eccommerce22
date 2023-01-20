
import 'package:flutter/material.dart';

import '../utilities/style/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MainButton({Key? key,required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: AppTheme.primaryColor
        ),
        child: Text(text,
       // style: Theme.of(context).textTheme.button ,
        ),

      ),

    );
  }
}
