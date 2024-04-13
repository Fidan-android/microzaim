import '../../conventions/enum/shared_keys.dart';

abstract class IStorageRepository {
  Future saveShared(String key, dynamic data);

  T? shared<T>(String key);

  Future removeShared(String key);
}
