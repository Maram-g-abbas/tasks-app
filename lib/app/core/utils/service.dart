import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SharedPreferencesService extends GetxService {
  final _storage = GetStorage();

  void saveValue(String key, String value) {
    _storage.write(key, value);
  }

  String getValue(String key) {
    return _storage.read(key) ?? '';
  }

  void removeValue(String key) {
    _storage.remove(key);
  }

  void clearAll() {
    _storage.erase();
  }
}