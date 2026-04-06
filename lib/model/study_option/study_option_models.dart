class StudyTopicModel {
  final String id;
  final String title;
  final String description;
  final int lessonCount;

  const StudyTopicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.lessonCount,
  });

  factory StudyTopicModel.fromJson(Map<String, dynamic> json) {
    return StudyTopicModel(
      id: (json['_id'] ?? '').toString(),
      title: (json['title'] ?? '').toString().trim(),
      description: (json['description'] ?? '').toString().trim(),
      lessonCount: _toInt(json['lessonCount']),
    );
  }

  static int _toInt(dynamic value) {
    if (value is int) return value;
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}

class GetAllTopicsResponseModel {
  final bool success;
  final String message;
  final List<StudyTopicModel> data;

  const GetAllTopicsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllTopicsResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    final topics = rawData is List
        ? rawData
              .whereType<Map<String, dynamic>>()
              .map(StudyTopicModel.fromJson)
              .toList(growable: false)
        : <StudyTopicModel>[];

    return GetAllTopicsResponseModel(
      success: json['success'] == true,
      message: (json['message'] ?? '').toString(),
      data: topics,
    );
  }
}

class ChooseGrowthZoneRequestModel {
  final List<String> titles;

  const ChooseGrowthZoneRequestModel({required this.titles});

  Map<String, dynamic> toJson() {
    return {'titles': titles};
  }
}

class ChooseGrowthZoneResponseModel {
  final bool success;
  final String message;

  const ChooseGrowthZoneResponseModel({
    required this.success,
    required this.message,
  });

  factory ChooseGrowthZoneResponseModel.fromJson(Map<String, dynamic> json) {
    return ChooseGrowthZoneResponseModel(
      success: json['success'] == true,
      message: (json['message'] ?? '').toString(),
    );
  }
}
