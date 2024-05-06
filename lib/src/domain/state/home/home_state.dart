import 'package:microzaim/src/conventions/enum/shared_keys.dart';
import 'package:mobx/mobx.dart';

import '../../../data/repository/storage_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._storageRepository);

  final StorageRepository _storageRepository;

  @observable
  bool? isSubscribed;

  @action
  bool? checkSubscribe() {
    isSubscribed = _storageRepository.shared(SharedKeys.subscribe.key) ?? false;
    return isSubscribed;
  }

  @action
  Future doSubscribe() async {
    await _storageRepository.saveShared(SharedKeys.subscribe.key, true);
    isSubscribed = true;
  }

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  changeIndex(int index) {
    currentIndex = index;
  }
}
