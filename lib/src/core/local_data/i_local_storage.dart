abstract class ILocalStorage {
  Future<bool> saveData(String table, String key, dynamic value);
  Future<dynamic> getData(String table, String key);
  Future<bool> deleteData(String table, String key);
  Future<bool> deleteAllData(String table);
  Future<List<String>> getAllKeys(String table);
  Future<Map<String, dynamic>> getAllData(String table);
  Future<List<dynamic>> getAllValues(String table);
}
