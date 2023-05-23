import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  HttpService() {
    _dio = Dio();
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler) {
        print(error.message);
      },
      onRequest: (request, errorInterceptorHandler) {
        print('${request.method} ${request.path}');
      },
      onResponse: (response, errorInterceptorHandler) {
        print(response.data);
      },
    ));
  }

  Future<Map> fetchPlantsData(String endPoint) async {
    try {
      var response = await Dio().get('https://perenual.com/api/$endPoint');
      var output = response.data as Map<dynamic, dynamic>;
      return output;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
//response is of response<dynamic>, i want to return output as Map<string,dynamic>
}
