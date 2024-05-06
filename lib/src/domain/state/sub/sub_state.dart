import 'package:microzaim/src/conventions/enum/shared_keys.dart';
import 'package:mobx/mobx.dart';

import '../../../data/repository/storage_repository.dart';

part 'sub_state.g.dart';

class SubState = SubStateBase with _$SubState;

abstract class SubStateBase with Store {
  SubStateBase(this._storageRepository);

  final StorageRepository _storageRepository;

  @observable
  bool isSubscribed = false;

  @action
  Future doSubscribe() async {
    await _storageRepository.saveShared(SharedKeys.subscribe.key, true);
    isSubscribed = true;
  }
}
