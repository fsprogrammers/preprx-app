import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preprx/model/mind_rx/mind_rx_models.dart';
import 'package:preprx/repository/mind_rx/mind_rx_repository.dart';

class MindRxState {
  final bool isSubmittingMood;
  final bool hasCheckedInToday;
  final bool isLoadingVisualizations;
  final String? errorMessage;
  final String? successMessage;
  final List<VisualizationItemModel> visualizations;

  const MindRxState({
    required this.isSubmittingMood,
    required this.hasCheckedInToday,
    required this.isLoadingVisualizations,
    required this.errorMessage,
    required this.successMessage,
    required this.visualizations,
  });

  const MindRxState.initial()
    : isSubmittingMood = false,
      hasCheckedInToday = false,
      isLoadingVisualizations = false,
      errorMessage = null,
      successMessage = null,
      visualizations = const [];

  MindRxState copyWith({
    bool? isSubmittingMood,
    bool? hasCheckedInToday,
    bool? isLoadingVisualizations,
    String? errorMessage,
    bool clearError = false,
    String? successMessage,
    bool clearSuccess = false,
    List<VisualizationItemModel>? visualizations,
  }) {
    return MindRxState(
      isSubmittingMood: isSubmittingMood ?? this.isSubmittingMood,
      hasCheckedInToday: hasCheckedInToday ?? this.hasCheckedInToday,
      isLoadingVisualizations:
          isLoadingVisualizations ?? this.isLoadingVisualizations,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      successMessage: clearSuccess
          ? null
          : successMessage ?? this.successMessage,
      visualizations: visualizations ?? this.visualizations,
    );
  }
}

class MindRxViewModel extends Notifier<MindRxState> {
  late final MindRxRepository _repository;

  @override
  MindRxState build() {
    _repository = ref.read(mindRxRepositoryProvider);
    return const MindRxState.initial();
  }

  Future<bool> submitMoodCheckIn({
    required String? token,
    required int moodValue,
  }) async {
    if (token == null || token.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: 'Session expired. Please login again.',
      );
      return false;
    }

    state = state.copyWith(
      isSubmittingMood: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      final response = await _repository.submitDailyFeelingCheckIn(
        token: token,
        moodValue: moodValue,
      );

      state = state.copyWith(
        isSubmittingMood: false,
        hasCheckedInToday: true,
        successMessage: response.message.isNotEmpty
            ? response.message
            : 'Mood check-in recorded successfully.',
      );
      return true;
    } catch (e) {
      final normalizedError = e.toString().toLowerCase();
      final alreadyCheckedIn =
          normalizedError.contains('already') &&
          (normalizedError.contains('check') ||
              normalizedError.contains('today'));

      state = state.copyWith(
        isSubmittingMood: false,
        hasCheckedInToday: alreadyCheckedIn || state.hasCheckedInToday,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<bool> loadVisualizations({required String? token}) async {
    if (token == null || token.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: 'Session expired. Please login again.',
      );
      return false;
    }

    state = state.copyWith(
      isLoadingVisualizations: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      final response = await _repository.getAllVisualizations(token: token);
      state = state.copyWith(
        isLoadingVisualizations: false,
        visualizations: response.data,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoadingVisualizations: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  void clearMessages() {
    state = state.copyWith(clearError: true, clearSuccess: true);
  }
}

final mindRxRepositoryProvider = Provider<MindRxRepository>((ref) {
  return MindRxRepository();
});

final mindRxViewModelProvider = NotifierProvider<MindRxViewModel, MindRxState>(
  MindRxViewModel.new,
);
