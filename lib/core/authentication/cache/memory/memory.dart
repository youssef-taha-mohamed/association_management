import 'dart:developer';
import '../base/auth.dart';

final class MemoryAuthenticationCache implements AuthenticationCache {
  MemoryAuthenticationCache();

  String? _token;

  @override
  Future<void> init() async {
    log('MemoryAuthenticationCache initialized  haha 😉');
  }

  @override
  Future<void> cacheToken({required String token}) async {
    _token = token;
  }

  @override
  Future<String?> cachedToken() async {
    return _token;
  }

  @override
  Future<void> destroyToken() async {
     _token = null;
  }

}
