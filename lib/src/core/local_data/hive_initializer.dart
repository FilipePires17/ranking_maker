import 'package:hive_flutter/adapters.dart';

import '../../constants/hive/hive_keys.dart';

class HiveInitializer {
  static Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes();
  }

  static Future<void> openBoxes() async {
    await Hive.openBox(HiveBoxNames.rank);
  }
}
