import 'package:ecommerce22/view/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/local/helper/shared.dart';
import '../../model/onboarding_model.dart';
import '../utilities/router/constans.dart';
import '../utilities/setrings.dart';
import '../utilities/style/colors.dart';
import '../widgets/default_text.dart';
import '../widgets/main_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  PageController boardPageController = PageController();

  void finishOnBoarding(BuildContext context, String screenName) {
    MyCache.putBoolean(key: MyCacheKeys.IS_ON_BOARDING, value: true);
    // MyCache.saveDataToSP(key: MyCacheKeys.IS_ON_BOARDING, value: true);
    Navigator.of(context).pushNamed(screenName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            child: DefaultText(
              text: AppString.skip,
              color: AppTheme.primaryColor,
              fontSize: 15.sp,
            ),
            onPressed: () {
              finishOnBoarding(context,
                  AppRoute.registerScreen);
            },
          ),
        ],
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
                children: [
                  // Container(
                  //   decoration:  BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage(
                  //             AppAssets.background),
                  //         fit: BoxFit.fill),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Container(
                      height: double.infinity.h,
                      decoration: const BoxDecoration(
                        color: AppTheme.lightGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.0.w,right: 4.0.w,bottom: 2.0.h),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: PageView.builder(
                              itemBuilder: (context, index) =>
                                  buildBoardingItem(boardingList[index]),
                              itemCount: boardingList.length,
                              physics: const BouncingScrollPhysics(),
                              controller: boardPageController,
                              onPageChanged: (int index) {

                                if (index == boardingList.length - 1) {
                                  setState(() {
                                    isLast = true;
                                  });
                                } else {
                                  isLast = false;
                                }
                              },
                            ),
                          ),
                          Center(
                            child: SmoothPageIndicator(
                              controller: boardPageController,
                              count: boardingList.length,
                              effect: ExpandingDotsEffect(
                                dotColor: Colors.grey,
                                activeDotColor: AppTheme.primaryColor,
                                expansionFactor: 4,
                                dotHeight: 1.h,
                                dotWidth: 3.w,
                                spacing: 5,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  // ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.h, bottom: 5.h),
            child: MainButton(
              // icon: Icons.arrow_forward,
              onTap: () {
                Navigator.pushNamed(context, AppRoute.loginPageRoute);
              }, text: 'Next',
            ),
          ),
        ],
      ),
    );}
}

Widget buildBoardingItem(BoardingModel boardingListItem) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage(boardingListItem.image), fit: BoxFit.contain,)),
      Text(
        boardingListItem.title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(
        height: 3.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Text(
          boardingListItem.body,
          maxLines: 4,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            overflow: TextOverflow.ellipsis,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
    ],
  );
}
