import 'dart:convert';
import '../../../../core/network/client/base/client.dart';
import '../../../../core/network/response_handler/base/response_handler.dart';

class ConfigDataSource {
  ConfigDataSource({
    required NetworkClient client,
    required ResponseHandler responseHandler,
  })  : _client = client,
        _responseHandler = responseHandler;
 static const configurationsEndpoint = 'api/v1/list-configurations';

  final NetworkClient _client;
  final ResponseHandler _responseHandler;

  Future<List> getConfig() async {
    final response = await _client.get(
      uri: Uri.parse(
        configurationsEndpoint
      ),
    );
    return _responseHandler.handle<List>(
      response: response,
      expectedCases: [200, 201, 202],
      expectedCasesHandler: (status) {
        var jsonDecode = json.decode(response.body);
        var config = jsonDecode['data']['items'];
        return config;
      },
    );
  }
}
