import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base/client.dart';
import '../base/response.dart';

final class HttpNetworkClient implements NetworkClient {
  const HttpNetworkClient();

  @override
  Future<NetworkResponse> delete({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await http.delete(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> get({
    required Uri uri,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      uri,
      headers: headers,
    );
    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> head({
    required Uri uri,
    Map<String, String>? headers,
  }) async {
    final response = await http.head(
      uri,
      headers: headers,
    );
    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> patch({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await http.patch(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> post({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await http.post(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> put({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await http.put(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return _adaptResponse(response);
  }

  NetworkResponse _adaptResponse(http.Response response) {
    return NetworkResponse(
      statusCode: response.statusCode,
      body: response.body,
      headers: response.headers,
    );
  }
}
