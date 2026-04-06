import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preprx/model/study_option/study_option_models.dart';
import 'package:preprx/repository/study_option/study_option_repository.dart';

class StudyOptionState {
  final bool isLoadingTopics;
  final bool isSaving;
  final String? errorMessage;
  final List<StudyTopicModel> topics;
  final List<String> selectedTopicIds;

  const StudyOptionState({
    required this.isLoadingTopics,
    required this.isSaving,
    required this.errorMessage,
    required this.topics,
    required this.selectedTopicIds,
  });

  const StudyOptionState.initial()
    : isLoadingTopics = false,
      isSaving = false,
      errorMessage = null,
      topics = const [],
      selectedTopicIds = const [];

  StudyOptionState copyWith({
    bool? isLoadingTopics,
    bool? isSaving,
    String? errorMessage,
    bool clearError = false,
    List<StudyTopicModel>? topics,
    List<String>? selectedTopicIds,
  }) {
    return StudyOptionState(
      isLoadingTopics: isLoadingTopics ?? this.isLoadingTopics,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      topics: topics ?? this.topics,
      selectedTopicIds: selectedTopicIds ?? this.selectedTopicIds,
    );
  }
}

class StudyOptionViewModel extends Notifier<StudyOptionState> {
  late final StudyOptionRepository _repository;

  @override
  StudyOptionState build() {
    _repository = ref.read(studyOptionRepositoryProvider);
    return const StudyOptionState.initial();
  }

  Future<bool> loadTopics({required String? token}) async {
    if (token == null || token.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: 'Session expired. Please login again.',
      );
      return false;
    }

    state = state.copyWith(isLoadingTopics: true, clearError: true);

    try {
      final response = await _repository.getAllTopics(token: token);
      state = state.copyWith(
        isLoadingTopics: false,
        topics: response.data,
        selectedTopicIds: state.selectedTopicIds
            .where((id) => response.data.any((topic) => topic.id == id))
            .toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoadingTopics: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<bool> saveGrowthZone({
    required String? token,
    required List<String> topicIds,
  }) async {
    if (token == null || token.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: 'Session expired. Please login again.',
      );
      return false;
    }

    state = state.copyWith(isSaving: true, clearError: true);

    try {
      await _repository.chooseGrowthZone(token: token, topicIds: topicIds);
      state = state.copyWith(isSaving: false, selectedTopicIds: topicIds);
      return true;
    } catch (e) {
      state = state.copyWith(isSaving: false, errorMessage: e.toString());
      return false;
    }
  }

  void toggleTopic(String topicId) {
    final selected = state.selectedTopicIds.toList();
    if (selected.contains(topicId)) {
      selected.remove(topicId);
    } else {
      selected.add(topicId);
    }

    state = state.copyWith(selectedTopicIds: selected);
  }
}

final studyOptionRepositoryProvider = Provider<StudyOptionRepository>((ref) {
  return StudyOptionRepository();
});

final studyOptionViewModelProvider =
    NotifierProvider<StudyOptionViewModel, StudyOptionState>(
      StudyOptionViewModel.new,
    );
