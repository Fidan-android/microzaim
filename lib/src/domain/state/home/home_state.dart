import 'package:mobx/mobx.dart';

import '../../../data/repository/storage_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._storageRepository);

  final StorageRepository _storageRepository;

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  changeIndex(int index) {
    currentIndex = index;
  }
}
