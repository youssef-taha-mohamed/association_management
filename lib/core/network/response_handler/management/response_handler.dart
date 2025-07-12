import 'dart:convert';
import '../../client/base/response.dart';
import '../../exception/response.dart';
import '../base/response_handler.dart';

final class ManagementResponseHandler implements ResponseHandler {
  const ManagementResponseHandler();

  @override
  T handle<T>({
    required NetworkResponse response,
    required List<int> expectedCases,
    required CaseHandler<T> expectedCasesHandler,
  }) {
    final responseStatus = response.statusCode;

    if (expectedCases.contains(responseStatus)) {
      return expectedCasesHandler(responseStatus);
    }

    final errorMessage = _extractExceptionMessage(response);

    switch (responseStatus) {
      case 100:
        throw ContinueException(message: errorMessage);
      case 101:
        throw SwitchingProtocolsException(message: errorMessage);
      case 201:
        throw CreatedException(message: errorMessage);
      case 202:
        throw AcceptedException(message: errorMessage);
      case 203:
        throw NonAuthoritativeInformationException(message: errorMessage);
      case 204:
        throw NoContentException(message: errorMessage);
      case 205:
        throw ResetContentException(message: errorMessage);
      case 206:
        throw PartialContentException(message: errorMessage);
      case 300:
        throw MultipleChoicesException(message: errorMessage);
      case 301:
        throw MovedPermanentlyException(message: errorMessage);
      case 302:
        throw FoundException(message: errorMessage);
      case 303:
        throw SeeOtherException(message: errorMessage);
      case 304:
        throw NotModifiedException(message: errorMessage);
      case 305:
        throw UseProxyException(message: errorMessage);
      case 307:
        throw TemporaryRedirectException(message: errorMessage);
      case 308:
        throw PermanentRedirectException(message: errorMessage);
      case 400:
        throw BadRequestException(message: errorMessage);
      case 401:
        throw UnauthorizedException(message: errorMessage);
      case 402:
        throw PaymentRequiredException(message: errorMessage);
      case 403:
        throw ForbiddenException(message: errorMessage);
      case 404:
        throw NotFoundException(message: errorMessage);
      case 405:
        throw MethodNotAllowedException(message: errorMessage);
      case 406:
        throw NotAcceptableException(message: errorMessage);
      case 407:
        throw ProxyAuthenticationRequiredException(message: errorMessage);
      case 408:
        throw RequestTimeoutException(message: errorMessage);
      case 409:
        throw ConflictException(message: errorMessage);
      case 410:
        throw GoneException(message: errorMessage);
      case 411:
        throw LengthRequiredException(message: errorMessage);
      case 412:
        throw PreconditionFailedException(message: errorMessage);
      case 413:
        throw PayloadTooLargeException(message: errorMessage);
      case 414:
        throw UriTooLongException(message: errorMessage);
      case 415:
        throw UnsupportedMediaTypeException(message: errorMessage);
      case 416:
        throw RangeNotSatisfiableException(message: errorMessage);
      case 417:
        throw ExpectationFailedException(message: errorMessage);
      case 418:
        throw ImATeapotException(message: errorMessage);
      case 421:
        throw MisdirectedRequestException(message: errorMessage);
      case 422:
        throw UnprocessableEntityException(message: errorMessage);
      case 423:
        throw LockedException(message: errorMessage);
      case 424:
        throw FailedDependencyException(message: errorMessage);
      case 426:
        throw UpgradeRequiredException(message: errorMessage);
      case 428:
        throw PreconditionRequiredException(message: errorMessage);
      case 429:
        throw TooManyRequestsException(message: errorMessage);
      case 431:
        throw RequestHeaderFieldsTooLargeException(message: errorMessage);
      case 451:
        throw UnavailableForLegalReasonsException(message: errorMessage);
      case 500:
        throw InternalServerErrorException(message: errorMessage);
      case 501:
        throw NotImplementedException(message: errorMessage);
      case 502:
        throw BadGatewayException(message: errorMessage);
      case 503:
        throw ServiceUnavailableException(message: errorMessage);
      case 504:
        throw GatewayTimeoutException(message: errorMessage);
      case 505:
        throw HttpVersionNotSupportedException(message: errorMessage);
      case 506:
        throw VariantAlsoNegotiatesException(message: errorMessage);
      case 507:
        throw InsufficientStorageException(message: errorMessage);
      case 508:
        throw LoopDetectedException(message: errorMessage);
      case 510:
        throw NotExtendedException(message: errorMessage);
      case 511:
        throw NetworkAuthenticationRequiredException(message: errorMessage);
      default:
        throw ResponseException('Failed to load data: ${response.statusCode}');
    }
  }

  String? _extractExceptionMessage(NetworkResponse response) {
    try {
      final json = Map<String, dynamic>.from(jsonDecode(response.body) as Map);

      if (json case {"errors": {"error_message": String _}}) {
        return Map<String, dynamic>.from(json['errors'])['error_message']
        as String;
      }
    } catch (_) {}
    return null;
  }
}
