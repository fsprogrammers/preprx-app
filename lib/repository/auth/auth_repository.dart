import 'package:preprx/model/auth/auth_request_models.dart';
import 'package:preprx/model/auth/auth_response_models.dart';
import 'package:preprx/services/data/base_api_services.dart';
import 'package:preprx/services/data/network_api_services.dart';
import 'package:preprx/utils/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices;

  AuthRepository({BaseApiServices? apiServices})
    : _apiServices = apiServices ?? NetworkApiServices();

  Future<RegisterResponseModel> createAccount(RegisterRequestModel request) async {
    final response = await _apiServices.postApi(
      request.toJson(),
      AppUrls.createAccount,
      null,
      isJson: true,
    );

    return RegisterResponseModel.fromJson(Map<String, dynamic>.from(response));
  }

  Future<LoginResponseModel> loginAccount(LoginRequestModel request) async {
    final response = await _apiServices.postApi(
      request.toJson(),
      AppUrls.loginAccount,
      null,
      isJson: true,
    );

    return LoginResponseModel.fromJson(Map<String, dynamic>.from(response));
  }
}
