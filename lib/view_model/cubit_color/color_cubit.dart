import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/local/helper/shared.dart';
import '../../view/utilities/enums.dart';
part 'color_state.dart';
class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorInitial());
static  ColorCubit get(context)=> BlocProvider.of(context);
bool isDarkTheme = false;

void changeAppTheme(){
  isDarkTheme = !isDarkTheme;
  MyCache.putBoolean(key: MyCacheKeys.theme,
      value: isDarkTheme);
  emit(ChangeColorTheme());
}

void getAppTheme(){
  isDarkTheme =MyCache.getBoolean(key:MyCacheKeys.theme);
}


}
