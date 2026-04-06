import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_button.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/components/custom_toplogo.dart';
import 'package:preprx/model/study_option/study_option_models.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/utils/app_toast.dart';
import 'package:preprx/view_model/auth/auth_view_model.dart';
import 'package:preprx/view_model/study_option/study_option_view_model.dart';

class StudyOptionView extends ConsumerStatefulWidget {
  const StudyOptionView({super.key});

  @override
  ConsumerState<StudyOptionView> createState() => _StudyOptionViewState();
}

class _StudyOptionViewState extends ConsumerState<StudyOptionView> {
  String? get _token =>
      ref.read(authViewModelProvider).loginResponse?.token?.trim();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(studyOptionViewModelProvider.notifier).loadTopics(token: _token);
    });
  }

  Future<void> _onSavePressed() async {
    final selectedTopicIds = ref
        .read(studyOptionViewModelProvider)
        .selectedTopicIds;

    if (selectedTopicIds.isEmpty) {
      CustomToast.warning(msg: 'Please select at least one topic.');
      return;
    }

    final ok = await ref
        .read(studyOptionViewModelProvider.notifier)
        .saveGrowthZone(token: _token, topicIds: selectedTopicIds);

    if (!context.mounted) return;

    final state = ref.read(studyOptionViewModelProvider);
    if (ok) {
      CustomToast.success(msg: 'Growth zones saved successfully.');
      goRouter.push(AppRoutes.host);
      return;
    }

    final error = (state.errorMessage ?? 'Unable to save growth zones')
        .replaceFirst('Exception: ', '')
        .replaceFirst('FetchDataException: ', '')
        .trim();

    CustomToast.error(msg: error);
  }

  String _iconForTopic(String title) {
    final normalized = title.toLowerCase();

    if (normalized.contains('pharma')) return AppImages.pharma;
    if (normalized.contains('pediatric')) return 'assets/images/baby.svg';
    if (normalized.contains('infection')) return AppImages.infectionControl;
    if (normalized.contains('psych') || normalized.contains('behavior')) {
      return AppImages.brain;
    }
    if (normalized.contains('maternity') || normalized.contains('obstetric')) {
      return 'assets/images/maternity.svg';
    }
    if (normalized.contains('delegation') || normalized.contains('priority')) {
      return AppImages.delegation;
    }
    if (normalized.contains('med')) return 'assets/images/med.svg';

    return AppImages.allTopics;
  }

  Widget _buildTopicTile(StudyTopicModel topic) {
    final selectedIds = ref
        .watch(studyOptionViewModelProvider)
        .selectedTopicIds;
    final isSelected = selectedIds.contains(topic.id);

    return GestureDetector(
      onTap: () {
        ref.read(studyOptionViewModelProvider.notifier).toggleTopic(topic.id);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.teal : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : AppColors.teal,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    _iconForTopic(topic.title),
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
                    color: isSelected ? AppColors.teal : Colors.white,
                  ),
                ),
                verticalSpacer(height: 8),
                customText(
                  text: topic.title,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: isSelected ? Colors.white : AppColors.charcoal,
                  maxLine: 2,
                ),
                const Spacer(),
                customText(
                  text: topic.description,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: isSelected ? Colors.white : AppColors.bodytext,
                  maxLine: 3,
                ),
                verticalSpacer(height: 6),
                customText(
                  text: '${topic.lessonCount} lessons',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.9)
                      : AppColors.bodytext,
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.verified, color: AppColors.gold, size: 20.w),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final studyOptionState = ref.watch(studyOptionViewModelProvider);
    final zones = studyOptionState.topics;

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 160.h),
          child: GradientsmallBackground(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: customButton(
                context: context,
                text: "Save & Start Daily Dose",
                fontSize: 16,
                height: 52,
                borderColor: Colors.transparent,
                bgColor: AppColors.gold,
                fontColor: AppColors.charcoal,
                borderRadius: 20,
                isCircular: false,
                fontWeight: FontWeight.w600,
                isLoading: studyOptionState.isSaving,
                onPressed: _onSavePressed,
              ),
            ),
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  verticalSpacer(height: 10),

                  // Top Logo
                  customTopLogo(),

                  verticalSpacer(height: 25),

                  // Header Box
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        customText(
                          text: "Choose Your Growth Zones",
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColors.charcoal,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpacer(height: 8),
                        customText(
                          text:
                              "Select the nursing topics you want to focus on first. You can update these anytime in your profile",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.bodytext,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  verticalSpacer(height: 20),

                  if (studyOptionState.isLoadingTopics)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  else if (zones.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: customText(
                        text: 'No topics found. Please try again.',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.bodytext,
                        textAlign: TextAlign.center,
                      ),
                    )
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: zones.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.80,
                      ),
                      itemBuilder: (context, index) {
                        return _buildTopicTile(zones[index]);
                      },
                    ),

                  // Extra padding at bottom to prevent overlap with bottom navigation bar
                  verticalSpacer(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
