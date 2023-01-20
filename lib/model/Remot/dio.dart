import 'package:dio/dio.dart';
import 'end_point.dart';
class DioHelper {
  static late Dio dio;
  init() {
    dio = Dio(
        BaseOptions(
            baseUrl: baseUrl,
            headers:
            {
              'Accept': 'application/json',
              'Content-Type': "application/json",
              'lang': 'en',
            }
        )
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      dio.options.headers =
      {'Authorization': 'Bearer ${token ?? ''}',};
      final Response response = await
      dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    }
    catch (e) {
      rethrow;
    }
  }

  static Future<Response> postData({
  required String url,
  required Map<String,dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress
})async{
    try{
      dio.options.headers={
        'Authorization': 'Bearer ${token ?? ''}'
      };
      final Response response = await dio.post(
        url,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    }
    catch(e){
      rethrow;
    }
  }
  static Future<Response>deleteDate({
  required String url,
    Map<String ,dynamic>? data,
   required String token,
})async{
    try{
       dio.options.headers={
         'Authorization':'Bearer $token'
       };
      final Response response =await dio.delete(
        url,
        data: data,
      );
      return response;
}
catch(e){
      rethrow;
}
}
}
