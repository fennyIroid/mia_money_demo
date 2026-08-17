import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import 'api_interceptor.dart';

/// Third-party singletons live here. The Dio client is wired now (base URL,
/// interceptors, global loader) so that swapping the dummy repositories for real
/// remote ones later touches only the data layer.
@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio {
    final Dio client = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        connectTimeout: AppConstants.networkTimeout,
        receiveTimeout: AppConstants.networkTimeout,
        sendTimeout: AppConstants.networkTimeout,
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    client.interceptors.add(ApiInterceptor());
    return client;
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
}

/// Global loader configuration. Features never call show/dismiss themselves —
/// [ApiInterceptor] owns the lifecycle around every request.
void configureGlobalLoader() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.slate
    ..indicatorColor = AppColors.ember
    ..progressColor = AppColors.ember
    ..textColor = AppColors.frost
    ..maskColor = AppColors.scrim
    ..radius = 22
    ..indicatorSize = 38
    ..displayDuration = const Duration(milliseconds: 1600)
    ..userInteractions = false
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.custom
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..textStyle = const TextStyle(
      color: AppColors.frost,
      fontFamily: 'Epilogue',
      fontSize: 13,
    );
}
