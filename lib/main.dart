import 'package:ecommerce22/view/utilities/router/router.dart';
import 'package:ecommerce22/view/utilities/style/theme/theme.dart';
import 'package:ecommerce22/view_model/cubit_color/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'model/local/helper/shared.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(MyApp(), );
  MyCache.init();

}

class MyApp extends StatelessWidget {
   MyApp({super.key});
final AppRouter appRouter =AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ColorCubit(),
          ),
        ],
        child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
        return Sizer(builder: (context, orientation, deviceType) {
        ColorCubit cubit = ColorCubit.get(context);
        cubit.getAppTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: cubit.isDarkTheme ?
          Themes.darkTheme : Themes.lightTheme,
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      });
  }));
  }
}
