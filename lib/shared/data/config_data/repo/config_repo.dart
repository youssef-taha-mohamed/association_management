import '../data_source/config_data_source.dart';

class ConfigRepo {
  ConfigRepo({required ConfigDataSource configDataSource}) : _configDataSource = configDataSource;
  final ConfigDataSource _configDataSource;

  Future<Map<String, dynamic>> getConfig() async {
    final data = await _configDataSource.getConfig();
    // Create a map to hold key-value pairs
    Map<String, dynamic> keyValueMap = {};
    // Populate the map with key-value pairs
    for (var item in data) {
      keyValueMap[item['key']] = item['value'];
    }
    return keyValueMap;
  }
}
