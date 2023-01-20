import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../model/local/helper/shared.dart';
import '../utilities/enums.dart';
import '../utilities/style/assets.dart';
import '../utilities/style/colors.dart';
import 'login_Screen.dart';
import 'onBoarding.dart';

class SplashScreen  extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool loading = true;

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
        MyCache.getBoolean(key: MyCacheKeys.IS_ON_BOARDING)==false?
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const OnBoardingScreen()
            )):  ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          height: 200.h,
          width: 200.w,
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.splashing,),
              Text("Welcome :)",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),

          // Opacity(
          //     opacity: 0.5,
          //     child: Image.asset(AppAssets.lights,width: double.infinity,height: double.infinity,fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}