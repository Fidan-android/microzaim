import 'package:microzaim/src/conventions/enum/shared_keys.dart';
import 'package:microzaim/src/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'init_state.g.dart';

class InitState = InitStateBase with _$InitState;

abstract class InitStateBase with Store {
  InitStateBase(this._storageRepository);

  final StorageRepository _storageRepository;

  @observable
  bool? isFirstLaunch;

  @action
  Future checkingTheFirstLaunch() async {
    isFirstLaunch = true;
    /*isFirstLaunch =
        _storageRepository.shared<bool>(SharedKeys.firstLaunch.key) ?? true;*/
    await _storageRepository.saveShared(SharedKeys.firstLaunch.key, false);
  }
}
