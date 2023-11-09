import 'enum/store_type.dart';

class LAAppConfig {
  final StoreType _storeType;

  bool get isGooglePlay => _storeType == StoreType.googlePlay;

  bool get isAppStore => _storeType == StoreType.appStore;

  bool get isNashStore => _storeType == StoreType.nashStore;

  bool get isRuStore => _storeType == StoreType.ruStore;

  String get storeTypeName => _storeType.name;

  LAAppConfig(
    this._storeType,
  );
}
