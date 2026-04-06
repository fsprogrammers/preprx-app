class DailyFeelingCheckInRequestModel {
  final int moodValue;

  const DailyFeelingCheckInRequestModel({required this.moodValue});

  Map<String, dynamic> toJson() {
    return {'moodValue': moodValue};
  }
}

class DailyFeelingCheckInResponseModel {
  final bool success;
  final String message;

  const DailyFeelingCheckInResponseModel({
    required this.success,
    required this.message,
  });

  factory DailyFeelingCheckInResponseModel.fromJson(Map<String, dynamic> json) {
    return DailyFeelingCheckInResponseModel(
      success: json['success'] == true,
      message: (json['message'] ?? '').toString(),
    );
  }
}

class VisualizationItemModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String duration;
  final String thumbnailUrl;
  final String mediaUrl;

  const VisualizationItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.duration,
    required this.thumbnailUrl,
    required this.mediaUrl,
  });

  factory VisualizationItemModel.fromJson(Map<String, dynamic> json) {
    return VisualizationItemModel(
      id: (json['_id'] ?? '').toString(),
      title: (json['title'] ?? '').toString().trim(),
      subtitle: (json['subtitle'] ?? '').toString().trim(),
      description: (json['description'] ?? '').toString().trim(),
      duration: (json['duration'] ?? '').toString().trim(),
      thumbnailUrl: (json['thumbnailUrl'] ?? json['thumbnail'] ?? '')
          .toString()
          .trim(),
      mediaUrl: (json['videoUrl'] ?? json['audioUrl'] ?? json['audio'] ?? '')
          .toString()
          .trim(),
    );
  }
}

class GetAllVisualizationsResponseModel {
  final bool success;
  final String message;
  final List<VisualizationItemModel> data;

  const GetAllVisualizationsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllVisualizationsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawData = json['data'];
    final visualizations = rawData is List
        ? rawData
              .whereType<Map<String, dynamic>>()
              .map(VisualizationItemModel.fromJson)
              .toList(growable: false)
        : <VisualizationItemModel>[];

    return GetAllVisualizationsResponseModel(
      success: json['success'] == true,
      message: (json['message'] ?? '').toString(),
      data: visualizations,
    );
  }
}
