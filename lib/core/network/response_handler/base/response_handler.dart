import '../../client/base/response.dart';

typedef CaseHandler<T> = T Function(int statusCode);

abstract interface class ResponseHandler {
  const ResponseHandler();

 T handle<T>({
    required NetworkResponse response,
    required List<int> expectedCases,
    required CaseHandler<T> expectedCasesHandler,
  });
}
