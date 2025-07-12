import 'dart:convert';
import 'response.dart';

abstract interface class NetworkClient {
  const NetworkClient();

  Future<NetworkResponse> head({
    required Uri uri,
    Map<String, String>? headers,
  });

  Future<NetworkResponse> get({
    required Uri uri,
    Map<String, String>? headers,
  });

  Future<NetworkResponse> post({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<NetworkResponse> put({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<NetworkResponse> patch({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<NetworkResponse> delete({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}
