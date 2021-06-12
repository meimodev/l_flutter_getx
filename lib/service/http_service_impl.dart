import 'package:dio/dio.dart';
import 'package:getx_news_app/service/http_service.dart';

const BASE_URL = "https://newsapi.org";
const API_KEY = 'c9740a17b80c4da4af541cb499dcf9cb';

class HttpServiceImpl implements HttpService {
  late Dio _dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      headers: {'Authorization': "Bearer $API_KEY"},
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('${options.method} | ${options.path}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          print(
              '${response.statusCode} | ${response.statusMessage} ${response.data}');
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          return handler.next(e); //continue
        },
      ),
    );

  @override
  Future<Response> getRequest(String url) async {
    late Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
    }
    return response;
  }

// initializeInterceptors() {
//   _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//     // Do something before request is sent
//     print('${options.method} | ${options.path}');
//
//     return handler.next(options); //continue
//     // If you want to resolve the request with some custom data，
//     // you can resolve a `Response` object eg: return `dio.resolve(response)`.
//     // If you want to reject the request with a error message,
//     // you can reject a `DioError` object eg: return `dio.reject(dioError)`
//   }, onResponse: (response, handler) {
//     // Do something with response data
//     print(
//         '${response.statusCode} | ${response.statusMessage} ${response.data}');
//
//     return handler.next(response); // continue
//     // If you want to reject the request with a error message,
//     // you can reject a `DioError` object eg: return `dio.reject(dioError)`
//   }, onError: (DioError e, handler) {
//     // Do something with response error
//     return handler.next(e); //continue
//     // If you want to resolve the request with some custom data，
//     // you can resolve a `Response` object eg: return `dio.resolve(response)`.
//   }));
// }
//
// @override
// void init() {
//   _dio = Dio(
//     BaseOptions(
//       baseUrl: BASE_URL,
//       headers: {'Authorization': "Bearer $API_KEY"},
//     ),
//   );
//   initializeInterceptors();
// }
}
