abstract interface class AuthenticationCache {
  const AuthenticationCache();
  Future<void> init();

  Future<void> cacheToken({required String token});

  Future<String?> cachedToken();

  Future<void> destroyToken();

}