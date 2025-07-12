import 'package:equatable/equatable.dart';

class NetworkResponse extends Equatable {
  final String body;
  final int statusCode;
  final Map<String, String> headers;

  const NetworkResponse({
    required this.body,
    required this.statusCode,
    this.headers = const <String, String>{},
  });

  @override
  List<Object?> get props => [
        body,
        statusCode,
        headers,
      ];
}
