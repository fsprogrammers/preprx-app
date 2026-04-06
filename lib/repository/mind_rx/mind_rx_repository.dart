import 'package:preprx/model/mind_rx/mind_rx_models.dart';
import 'package:preprx/services/data/base_api_services.dart';
import 'package:preprx/services/data/network_api_services.dart';
import 'package:preprx/utils/app_urls.dart';

class MindRxRepository {
  final BaseApiServices _apiServices;

  MindRxRepository({BaseApiServices? apiServices})
    : _apiServices = apiServices ?? NetworkApiServices();

  Future<DailyFeelingCheckInResponseModel> submitDailyFeelingCheckIn({
    required String token,
    required int moodValue,
  }) async {
    final request = DailyFeelingCheckInRequestModel(moodValue: moodValue);
    final response = await _apiServices.postApi(
      request.toJson(),
      AppUrls.dailyFeelingCheckIn,
      token,
      isJson: true,
    );

    return DailyFeelingCheckInResponseModel.fromJson(
      Map<String, dynamic>.from(response),
    );
  }

  Future<GetAllVisualizationsResponseModel> getAllVisualizations({
    required String token,
  }) async {
    final response = await _apiServices.getApi(
      AppUrls.getAllVisualizations,
      token,
    );

    return GetAllVisualizationsResponseModel.fromJson(
      Map<String, dynamic>.from(response),
    );
  }
}
