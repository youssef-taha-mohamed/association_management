import 'dart:convert';
import '../../../../../core/constant/endpoint.dart';
import '../../../../../core/network/client/base/client.dart';
import '../../../../../core/network/response_handler/base/response_handler.dart';
import '../../../domain/entities/login_credentials.dart';
import '../../../domain/entities/logout_params.dart';
import '../../../domain/entities/otp_confirmation_parameters.dart';
import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/entities/register_credentials.dart';
import '../../../domain/entities/reset_password_parameters.dart';
import '../../../domain/entities/social_media_credentials.dart';
import '../../models/login_credentials.dart';
import '../../models/logout_parameters.dart';
import '../../models/otp_confirmation_parameters.dart';
import '../../models/password_reset_request_params.dart';
import '../../models/register_credentials.dart';
import '../../models/reset_password_parameters.dart';
import '../../models/social_media_credentials.dart';
import '../base/data_source.dart';

final class AuthenticationRemoteDataSource implements AuthenticationDataSource {
  const AuthenticationRemoteDataSource({
    required NetworkClient client,
    required ResponseHandler responseHandler,
  })  : _client = client,
        _responseHandler = responseHandler;

  final NetworkClient _client;
  final ResponseHandler _responseHandler;

  @override
  Future<Map<String, dynamic>> login({
    required LoginCredentials credentials,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.login),
      body: LoginCredentialsDTO.fromEntity(credentials).toMap(),
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );


        return Map<String, dynamic>.from(jsonResponse['data'] as Map);
      },
    );
  }

  @override
  Future<Map<String, dynamic>> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.loginWithSocialMedia),
      body: SocialMediaCredentialsDTO.fromEntity(credentials).toMap(),
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );

        return Map<String, dynamic>.from(jsonResponse['data'] as Map);
      },
    );
  }

  @override
  Future<void> logout({
    required LogoutParameters parameters,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.logout),
      body: LogoutParametersDTO.fromEntity(parameters).toMap(),
    );

    return _responseHandler.handle<void>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {},
    );
  }

  @override
  Future<Map<String, dynamic>> register({
    required RegisterCredentials credentials,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.register),
      body: RegisterCredentialsDTO.fromEntity(credentials).toMap()
        ..removeWhere((key, value) => value == null),
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );

        return Map<String, dynamic>.from(jsonResponse['data'] as Map);
      },
    );
  }

  @override
  Future<void> confirmOtpToResetPassword({
    required OtpConfirmationParameters parameters,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.confirmOtpToResetPassword),
      body: OtpConfirmationParametersDTO.fromEntity(parameters).toMap(),
    );

    return _responseHandler.handle<void>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {},
    );
  }

  @override
  Future<Map<String, dynamic>> resetPasswordByOtp({
    required ResetPasswordParameters parameters,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.resetPasswordByOtp),
      body: ResetPasswordParametersDTO.fromEntity(parameters).toMap(),
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );

        return Map<String, dynamic>.from(jsonResponse['data'] as Map);
      },
    );
  }

  @override
  Future<String> sendOtpToResetPassword({
    required PasswordResetRequestParameters parameters,
  }) async {
    final response = await _client.post(
      uri: Uri.parse(ApiEndPoint.sendOtpToResetPassword),
      body: PasswordResetRequestParametersDTO.fromEntity(parameters).toMap(),
    );

    return _responseHandler.handle<String>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        return jsonDecode(response.body)['message'] as String;
      },
    );
  }
}
