import 'package:ecommerce22/view/utilities/router/constans.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, AppRoute.registerScreen);
        }, child: Text("done"))
      ],

    );
  }
}
