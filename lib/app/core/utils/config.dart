import 'dart:io';

class Config {
  static const String baseUrl = 'http://192.168.1.5:8000/api';
  static const String appVersion = '1.0.0';
  static const bool isDebug = bool.fromEnvironment('dart.vm.product');

  static String get platform {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return 'web';
    }
  }
}