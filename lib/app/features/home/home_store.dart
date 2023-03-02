import 'package:mobx/mobx.dart';
import 'package:seventh_prova_flutter/app/features/home/home_repository.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository repository;
  HomeStoreBase(this.repository);
}
