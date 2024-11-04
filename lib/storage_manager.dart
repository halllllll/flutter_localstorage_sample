import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static StorageManager? _instance;

  SharedPreferences? _prefs;
  FlutterSecureStorage? _storage;

  factory StorageManager() {
    _instance ??= StorageManager._internal();
    return _instance!;
  }

  StorageManager._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _storage = const FlutterSecureStorage();
  }

  // set pref value
  Future<void> setSharedPrefStringValue(
      {required String key, required String value}) async {
    if (_prefs != null) {
      await _prefs!.setString(key, value);
    } else {
      throw Exception("SharedPreferences not initialized");
    }
  }

  Future<void> setSharedPrefIntValue(
      {required String key, required int value}) async {
    if (_prefs != null) {
      await _prefs!.setInt(key, value);
    } else {
      throw Exception("SharedPreferences not initialized");
    }
  }

  // get pref value
  String? getSharedPrefStringValue({required String key}) {
    if (_prefs != null) {
      return _prefs!.getString(key);
    } else {
      throw Exception("SharedPreferences not initialized");
    }
  }

  int? getSharedPrefIntValue({required String key}) {
    if (_prefs != null) {
      return _prefs!.getInt(key);
    } else {
      throw Exception("SharedPreferences not initialized");
    }
  }

  // delete pref value
  Future<void> deleteSharedPrefValue(String key) async {
    if (_prefs != null) {
      await _prefs?.remove(key);
    } else {
      throw Exception("SharedPreferences not initialized");
    }
  }

  // set secure storage value
  Future<void> setSecureStorageValue(
      {required String key, required String value}) async {
    if (_storage != null) {
      await _storage!.write(key: key, value: value);
    } else {
      throw Exception("SecureStorage not initialized");
    }
  }

  // get secure storage value
  Future<String?> getSecureStorageValue({required String key}) async {
    if (_storage != null) {
      return await _storage!.read(key: key);
    } else {
      throw Exception("SecureStorage not initialized");
    }
  }

  // delete secure storage vaue
  Future<void> deleteSecureStorageValue({required String key}) async {
    if (_storage != null) {
      return await _storage!.delete(key: key);
    } else {
      throw Exception("SecureStorage not initialized");
    }
  }
}
