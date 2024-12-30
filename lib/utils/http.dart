import 'package:dio/dio.dart';

class NetworkService {
  // 1.创建一个dio示例对象
  final _dio = Dio();

  // 2. 统一配置
  NetworkService() {
    _dio.options
      ..baseUrl = 'https://live-api.itheima.net'
      ..headers = {'Content-Type': 'application/json'}
      ..connectTimeout = Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20);

    // 配置请求和响应拦截器
    _addInterceptors();
  }

  // 3. 添加拦截器
  void _addInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // 请求拦截器：添加公共请求参数、token等
      return handler.next(options);
    }, onResponse: (response, handler) {
      // 响应拦截器：统一拦截成功响应
      return handler.next(response);
    }, onError: (DioException error, handler) {
      // 响应拦截器：统一拦截错误响应
      return handler.next(error);
    }));
  }

  /// get请求
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final res = await _dio.get(url, queryParameters: params);
      return _handleResponse(res);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// post请求
  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    try {
      final res = await _dio.post(url, data: data);
      return _handleResponse(res);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// put请求
  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    try {
      final res = await _dio.put(url, data: data);
      return _handleResponse(res);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// delete请求
  Future<dynamic> delete(String url, {Map<String, dynamic>? data}) async {
    try {
      final res = await _dio.delete(url, data: data);
      return _handleResponse(res);
    } catch (e) {
      return _handleError(e);
    }
  }

  // 成功结果的处理
  dynamic _handleResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw Exception('请求失败，状态码${response.statusCode}');
    }
  }

  // 失败结果的处理
  dynamic _handleError(error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        throw Exception('请求连接超时');
      } else if (error.type == DioExceptionType.badResponse) {
        throw Exception('响应错误，状态码：${error.response?.statusCode}');
      } else {
        throw Exception('未知错误 $error');
      }
    }
  }
}

// 导出
final http = NetworkService();
