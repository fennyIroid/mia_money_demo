import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Owns the global loader lifecycle. Any request can opt out by sending
/// `extra: {ApiInterceptor.showLoaderKey: false}`.
class ApiInterceptor extends Interceptor {
  static const String showLoaderKey = 'showLoader';

  int _inFlight = 0;

  bool _shouldShowLoader(RequestOptions options) =>
      options.extra[showLoaderKey] as bool? ?? true;

  void _release() {
    _inFlight = (_inFlight - 1).clamp(0, 1 << 30);
    if (_inFlight == 0) {
      EasyLoading.dismiss();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_shouldShowLoader(options)) {
      _inFlight++;
      EasyLoading.show();
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (_shouldShowLoader(response.requestOptions)) {
      _release();
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldShowLoader(err.requestOptions)) {
      _release();
    }
    handler.next(err);
  }
}
