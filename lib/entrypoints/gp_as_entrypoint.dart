import 'dart:io';

import '../presentation/attributes/enum/store_type.dart';
import '../presentation/attributes/la_app_config.dart';
import 'base/entry_points.dart';

void main() async {
  final storeType =
      Platform.isAndroid ? StoreType.googlePlay : StoreType.appStore;

  final appConfig = LAAppConfig(
    storeType,
  );

  return EntryPoints.main(
    appConfig,
  );
}
