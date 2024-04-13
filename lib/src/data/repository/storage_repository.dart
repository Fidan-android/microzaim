import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/i_storage_repository.dart';

class StorageRepository extends IStorageRepository {
  StorageRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future saveShared(String key, dynamic data) async {
    switch (data.runtimeType) {
      case int:
        {
          await _sharedPreferences.setInt(key, data);
          break;
        }
      case String:
        {
          await _sharedPreferences.setString(key, data);
          break;
        }
      case bool:
        {
          await _sharedPreferences.setBool(key, data);
          break;
        }
      case double:
        {
          await _sharedPreferences.setDouble(key, data);
          break;
        }
      case List:
        {
          await _sharedPreferences.setStringList(key, data);
          break;
        }
      default:
        throw Exception("Unknown type");
    }
  }

  @override
  T? shared<T>(String key) {
    switch (T) {
      case String:
        {
          return _sharedPreferences.getString(key) as T?;
        }
      case int:
        {
          return _sharedPreferences.getInt(key) as T?;
        }
      case bool:
        {
          return _sharedPreferences.getBool(key) as T?;
        }
      case double:
        {
          return _sharedPreferences.getDouble(key) as T?;
        }
      case List:
        {
          return _sharedPreferences.getStringList(key) as T?;
        }
      default:
        {
          return throw Exception("Unknown type");
        }
    }
  }

  @override
  Future removeShared(String key) async {
    await _sharedPreferences.remove(key);
  }
}
