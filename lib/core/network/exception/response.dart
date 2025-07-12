class ResponseException {
  final String message;

  const ResponseException([
    this.message = "An error occurred during the response",
  ]);

  @override
  String toString() => 'ResponseException: $message';
}

class ContinueException extends ResponseException {
  ContinueException({
    String? message,
  }) : super(message ?? "Continue");
}

class SwitchingProtocolsException extends ResponseException {
  SwitchingProtocolsException({
    String? message,
  }) : super(message ?? "Switching Protocols");
}

class CreatedException extends ResponseException {
  CreatedException({
    String? message,
  }) : super(message ?? "Created");
}

class AcceptedException extends ResponseException {
  AcceptedException({
    String? message,
  }) : super(message ?? "Accepted");
}

class NonAuthoritativeInformationException extends ResponseException {
  NonAuthoritativeInformationException({
    String? message,
  }) : super(message ?? "Non-Authoritative Information");
}

class NoContentException extends ResponseException {
  NoContentException({
    String? message,
  }) : super(message ?? "No Content");
}

class ResetContentException extends ResponseException {
  ResetContentException({
    String? message,
  }) : super(message ?? "Reset Content");
}

class PartialContentException extends ResponseException {
  PartialContentException({
    String? message,
  }) : super(message ?? "Partial Content");
}

class MultipleChoicesException extends ResponseException {
  MultipleChoicesException({
    String? message,
  }) : super(message ?? "Multiple Choices");
}

class MovedPermanentlyException extends ResponseException {
  MovedPermanentlyException({
    String? message,
  }) : super(message ?? "Moved Permanently");
}

class FoundException extends ResponseException {
  FoundException({
    String? message,
  }) : super(message ?? "Found");
}

class SeeOtherException extends ResponseException {
  SeeOtherException({
    String? message,
  }) : super(message ?? "See Other");
}

class NotModifiedException extends ResponseException {
  NotModifiedException({
    String? message,
  }) : super(message ?? "Not Modified");
}

class UseProxyException extends ResponseException {
  UseProxyException({
    String? message,
  }) : super(message ?? "Use Proxy");
}

class TemporaryRedirectException extends ResponseException {
  TemporaryRedirectException({
    String? message,
  }) : super(message ?? "Temporary Redirect");
}

class PermanentRedirectException extends ResponseException {
  PermanentRedirectException({
    String? message,
  }) : super(message ?? "Permanent Redirect");
}

class BadRequestException extends ResponseException {
  BadRequestException({
    String? message,
  }) : super(message ?? "Bad Request");
}

class UnauthorizedException extends ResponseException {
  UnauthorizedException({
    String? message,
  }) : super(message ?? "Unauthorized");
}

class PaymentRequiredException extends ResponseException {
  PaymentRequiredException({
    String? message,
  }) : super(message ?? "Payment Required");
}

class ForbiddenException extends ResponseException {
  ForbiddenException({
    String? message,
  }) : super(message ?? "Forbidden");
}

class NotFoundException extends ResponseException {
  NotFoundException({
    String? message,
  }) : super(message ?? "Data Not Found");
}

class MethodNotAllowedException extends ResponseException {
  MethodNotAllowedException({
    String? message,
  }) : super(message ?? "Method Not Allowed");
}

class NotAcceptableException extends ResponseException {
  NotAcceptableException({
    String? message,
  }) : super(message ?? "Not Acceptable");
}

class ProxyAuthenticationRequiredException extends ResponseException {
  ProxyAuthenticationRequiredException({
    String? message,
  }) : super(message ?? "Proxy Authentication Required");
}

class RequestTimeoutException extends ResponseException {
  RequestTimeoutException({
    String? message,
  }) : super(message ?? "Request Timeout");
}

class ConflictException extends ResponseException {
  ConflictException({
    String? message,
  }) : super(message ?? "Conflict");
}

class GoneException extends ResponseException {
  GoneException({
    String? message,
  }) : super(message ?? "Gone");
}

class LengthRequiredException extends ResponseException {
  LengthRequiredException({
    String? message,
  }) : super(message ?? "Length Required");
}

class PreconditionFailedException extends ResponseException {
  PreconditionFailedException({
    String? message,
  }) : super(message ?? "Precondition Failed");
}

class PayloadTooLargeException extends ResponseException {
  PayloadTooLargeException({
    String? message,
  }) : super(message ?? "Payload Too Large");
}

class UriTooLongException extends ResponseException {
  UriTooLongException({
    String? message,
  }) : super(message ?? "URI Too Long");
}

class UnsupportedMediaTypeException extends ResponseException {
  UnsupportedMediaTypeException({
    String? message,
  }) : super(message ?? "Unsupported Media Type");
}

class RangeNotSatisfiableException extends ResponseException {
  RangeNotSatisfiableException({
    String? message,
  }) : super(message ?? "Range Not Satisfiable");
}

class ExpectationFailedException extends ResponseException {
  ExpectationFailedException({
    String? message,
  }) : super(message ?? "Expectation Failed");
}

class ImATeapotException extends ResponseException {
  ImATeapotException({
    String? message,
  }) : super(message ?? "I'm a teapot");
}

class MisdirectedRequestException extends ResponseException {
  MisdirectedRequestException({
    String? message,
  }) : super(message ?? "Misdirected Request");
}

class UnprocessableEntityException extends ResponseException {
  UnprocessableEntityException({
    String? message,
  }) : super(message ?? "Unprocessable Entity");
}

class LockedException extends ResponseException {
  LockedException({
    String? message,
  }) : super(message ?? "Locked");
}

class FailedDependencyException extends ResponseException {
  FailedDependencyException({
    String? message,
  }) : super(message ?? "Failed Dependency");
}

class UpgradeRequiredException extends ResponseException {
  UpgradeRequiredException({
    String? message,
  }) : super(message ?? "Upgrade Required");
}

class PreconditionRequiredException extends ResponseException {
  PreconditionRequiredException({
    String? message,
  }) : super(message ?? "Precondition Required");
}

class TooManyRequestsException extends ResponseException {
  TooManyRequestsException({
    String? message,
  }) : super(message ?? "Too Many Requests");
}

class RequestHeaderFieldsTooLargeException extends ResponseException {
  RequestHeaderFieldsTooLargeException({
    String? message,
  }) : super(message ?? "Request Header Fields Too Large");
}

class UnavailableForLegalReasonsException extends ResponseException {
  UnavailableForLegalReasonsException({
    String? message,
  }) : super(message ?? "Unavailable For Legal Reasons");
}

class InternalServerErrorException extends ResponseException {
  InternalServerErrorException({
    String? message,
  }) : super(message ?? "Internal Server Error");
}

class NotImplementedException extends ResponseException {
  NotImplementedException({
    String? message,
  }) : super(message ?? "Not Implemented");
}

class BadGatewayException extends ResponseException {
  BadGatewayException({
    String? message,
  }) : super(message ?? "Bad Gateway");
}

class ServiceUnavailableException extends ResponseException {
  ServiceUnavailableException({
    String? message,
  }) : super(message ?? "Service Unavailable");
}

class GatewayTimeoutException extends ResponseException {
  GatewayTimeoutException({
    String? message,
  }) : super(message ?? "Gateway Timeout");
}

class HttpVersionNotSupportedException extends ResponseException {
  HttpVersionNotSupportedException({
    String? message,
  }) : super(message ?? "HTTP Version Not Supported");
}

class VariantAlsoNegotiatesException extends ResponseException {
  VariantAlsoNegotiatesException({
    String? message,
  }) : super(message ?? "Variant Also Negotiates");
}

class InsufficientStorageException extends ResponseException {
  InsufficientStorageException({
    String? message,
  }) : super(message ?? "Insufficient Storage");
}

class LoopDetectedException extends ResponseException {
  LoopDetectedException({
    String? message,
  }) : super(message ?? "Loop Detected");
}

class NotExtendedException extends ResponseException {
  NotExtendedException({
    String? message,
  }) : super(message ?? "Not Extended");
}

class NetworkAuthenticationRequiredException extends ResponseException {
  NetworkAuthenticationRequiredException({
    String? message,
  }) : super(message ?? "Network Authentication Required");
}
