import 'package:hive_flutter/adapters.dart';

import 'i_local_storage.dart';

class HiveStorage implements ILocalStorage {
  @override
  Future<bool> deleteAllData(String table) async {
    final Box<dynamic> box = Hive.box(table);
    return (await box.clear()) > 0;
  }

  @override
  Future<bool> deleteData(String table, String key) async {
    final Box<dynamic> box = Hive.box(table);
    await box.delete(key);
    if (box.get(key) == null) {
      return true;
    }
    return false;
  }

  @override
  Future<Map<String, dynamic>> getAllData(String table) async {
    final Box<dynamic> box = Hive.box(table);
    return Map<String, dynamic>.fromIterables(
      box.keys.map((dynamic e) => e.toString()),
      box.values,
    );
  }

  @override
  Future<List<String>> getAllKeys(String table) async {
    final Box<dynamic> box = Hive.box(table);
    return box.keys.map((dynamic e) => e.toString()).toList();
  }

  @override
  Future<dynamic> getData(String table, String key) {
    final Box<dynamic> box = Hive.box(table);
    return box.get(key);
  }

  @override
  Future<bool> saveData(String table, String key, dynamic value) async {
    final Box<dynamic> box = Hive.box(table);
    await box.put(key, value);
    if (box.get(key) == value) {
      return true;
    }
    return false;
  }

  @override
  Future<List<dynamic>> getAllValues(String table) async {
    final Box<dynamic> box = Hive.box(table);
    return box.values.toList();
  }
}
