import 'package:preprx/model/study_option/study_option_models.dart';
import 'package:preprx/services/data/base_api_services.dart';
import 'package:preprx/services/data/network_api_services.dart';
import 'package:preprx/utils/app_urls.dart';

class StudyOptionRepository {
  final BaseApiServices _apiServices;

  StudyOptionRepository({BaseApiServices? apiServices})
    : _apiServices = apiServices ?? NetworkApiServices();

  Future<GetAllTopicsResponseModel> getAllTopics({
    required String token,
  }) async {
    final response = await _tryGet(
      endpoints: const [AppUrls.getAllTopicsApi, AppUrls.getAllTopics],
      token: token,
    );

    return GetAllTopicsResponseModel.fromJson(
      Map<String, dynamic>.from(response),
    );
  }

  Future<ChooseGrowthZoneResponseModel> chooseGrowthZone({
    required String token,
    required List<String> topicIds,
  }) async {
    final body = ChooseGrowthZoneRequestModel(titles: topicIds).toJson();
    final response = await _tryPost(
      endpoints: const [
        AppUrls.chooseGrowthZoneApi,
        AppUrls.chooseGrowthZone,
        AppUrls.chooseGrowthZoneApiAlt,
      ],
      token: token,
      body: body,
    );

    return ChooseGrowthZoneResponseModel.fromJson(
      Map<String, dynamic>.from(response),
    );
  }

  Future<dynamic> _tryGet({
    required List<String> endpoints,
    required String token,
  }) async {
    Object? lastError;

    for (final endpoint in endpoints) {
      try {
        return await _apiServices.getApi(endpoint, token);
      } catch (e) {
        lastError = e;
      }
    }

    throw Exception(
      'Unable to fetch topics from available endpoints: ${endpoints.join(', ')}. ${lastError ?? ''}',
    );
  }

  Future<dynamic> _tryPost({
    required List<String> endpoints,
    required String token,
    required Map<String, dynamic> body,
  }) async {
    Object? lastError;

    for (final endpoint in endpoints) {
      try {
        return await _apiServices.postApi(body, endpoint, token, isJson: true);
      } catch (e) {
        lastError = e;
      }
    }

    throw Exception(
      'Unable to save growth zones from available endpoints: ${endpoints.join(', ')}. ${lastError ?? ''}',
    );
  }
}
