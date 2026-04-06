import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_buildtile_icon.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/utils/app_toast.dart';
import 'package:preprx/view/home/widget/build_card.dart';
import 'package:preprx/view_model/auth/auth_view_model.dart';
import 'package:preprx/view_model/mind_rx/mind_rx_view_model.dart';

class MindRxView extends ConsumerStatefulWidget {
  const MindRxView({super.key});

  @override
  ConsumerState<MindRxView> createState() => _MindRxViewState();
}

class _MindRxViewState extends ConsumerState<MindRxView> {
  double _moodValue = 50;

  String? get _token =>
      ref.read(authViewModelProvider).loginResponse?.token?.trim();

  Future<void> _submitMoodCheckIn() async {
    final ok = await ref
        .read(mindRxViewModelProvider.notifier)
        .submitMoodCheckIn(token: _token, moodValue: _moodValue.round());

    if (!mounted) return;

    final state = ref.read(mindRxViewModelProvider);
    final successMessage = state.successMessage?.trim().isNotEmpty == true
        ? state.successMessage!.trim()
        : 'Mood check-in recorded! Stay focused.';

    if (ok) {
      CustomToast.success(msg: successMessage);
      return;
    }

    final error =
        (state.errorMessage ?? 'Failed to submit mood. Please try again.')
            .replaceFirst('Exception: ', '')
            .replaceFirst('FetchDataException: ', '')
            .trim();

    final normalized = error.toLowerCase();
    final alreadyCheckedIn =
        normalized.contains('already') &&
        (normalized.contains('check') || normalized.contains('today'));

    if (alreadyCheckedIn) {
      CustomToast.info(
        msg: "You've already checked in today. See you tomorrow!",
      );
    } else {
      CustomToast.error(msg: error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mindRxState = ref.watch(mindRxViewModelProvider);

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isSearch: false),
              ),
              verticalSpacer(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        // Header Card: Mind Rx & Mood Slider
                        buildCard(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.favourite, // Heart icon
                                    width: 24.w,
                                    height: 24.h,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.gold,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  horizontalSpacer(width: 12),
                                  customText(
                                    text: "Mind Rx",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: const Color(0xFF0C4866),
                                  ),
                                ],
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: "Manifestation and motivation hub",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 12),
                              customText(
                                text: "How are you feeling today",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.indigo,
                                textAlign: TextAlign.start,
                              ),
                              _buildMoodSlider(),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText(
                                      text: "Relaxed (${_moodValue.round()}%)",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: const Color(0xFF0C4866),
                                    ),
                                    customText(
                                      text: "Stressed",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: const Color(0xFF0C4866),
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpacer(height: 12),
                              if (!mindRxState.hasCheckedInToday)
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: mindRxState.isSubmittingMood
                                        ? null
                                        : _submitMoodCheckIn,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.teal,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12.h,
                                      ),
                                      elevation: 0,
                                    ),
                                    child: mindRxState.isSubmittingMood
                                        ? SizedBox(
                                            width: 18.w,
                                            height: 18.w,
                                            child:
                                                const CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.white,
                                                ),
                                          )
                                        : customText(
                                            text: 'Submit Check-in',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                  ),
                                )
                              else
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.teal.withValues(
                                      alpha: 0.12,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: customText(
                                    text: 'Today\'s check-in completed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: AppColors.teal,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Morning Affirmation
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Morning Affirmation",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 16),
                              Row(
                                spacing: 16.w,
                                children: [
                                  buildTealIconBox(AppImages.morning),
                                  Expanded(
                                    child: customText(
                                      text:
                                          "I am calm, capable and ready to succeed and step into my purpose",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.charcoal,
                                      maxLine: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 24),

                        // Grid items
                        Row(
                          children: [
                            Expanded(
                              child: buildGridItem(
                                icon: AppImages.brain,
                                title: "Visualization room",
                                desc: "Mini meditations for calm focus",
                                onTap: () {
                                  goRouter.push(AppRoutes.visualizationRoom);
                                },
                              ),
                            ),
                            horizontalSpacer(width: 16),
                            Expanded(
                              child: buildGridItem(
                                icon: AppImages.scription,
                                title: "Scripting space",
                                desc: "Journaling prompts for your journey",
                                onTap: () {
                                  goRouter.push(AppRoutes.scriptingSpace);
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: buildGridItem(
                                icon: AppImages.subliminal,
                                title: "Subliminal Study Mode",
                                desc: "Background +ve affirmations",
                                onTap: () {
                                  goRouter.push(AppRoutes.subliminalStudy);
                                },
                              ),
                            ),
                            horizontalSpacer(width: 16),
                            Expanded(
                              child: buildGridItem(
                                icon: AppImages.calendar,
                                title: "Manifestation Calendar",
                                desc: "Gratitude, Reflection, Focus",
                                onTap: () {
                                  goRouter.push(
                                    AppRoutes.manifestationCalendar,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        verticalSpacer(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodSlider() {
    final mindRxState = ref.watch(mindRxViewModelProvider);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 12.h,
        activeTrackColor: AppColors.gold,
        inactiveTrackColor: AppColors.teal.withValues(alpha: 0.3),
        thumbShape: _EmojiThumbShape(
          thumbRadius: 20.r,
          emojiAsset: AppImages.emoji,
        ),
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Slider(
        value: _moodValue,
        min: 0,
        max: 100,
        divisions: 100,
        onChanged:
            (mindRxState.isSubmittingMood || mindRxState.hasCheckedInToday)
            ? null
            : (value) {
                setState(() {
                  _moodValue = value;
                });
              },
      ),
    );
  }

  Widget buildGridItem({
    required String icon,
    required String title,
    required String desc,
    VoidCallback? onTap,
  }) {
    return buildCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTealIconBox(icon),
          verticalSpacer(height: 12),
          customText(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.charcoal,
            maxLine: 2,
          ),
          verticalSpacer(height: 8),
          customText(
            text: desc,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.bodytext,
            maxLine: 2,
          ),
        ],
      ),
    );
  }




}

class _EmojiThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final String emojiAsset;

  const _EmojiThumbShape({required this.thumbRadius, required this.emojiAsset});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(thumbRadius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    // Draw background shadow
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius, paint);

    // Draw Emoji SVG
    // We need to preload SVG or use a simpler approach here.
    // For now, let's draw a gold circle with a smiley face using paths to avoid async complexity in SliderTheme.
    final facePaint = Paint()
      ..color = AppColors.gold
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius, facePaint);

    final eyePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      center + Offset(-thumbRadius * 0.4, -thumbRadius * 0.2),
      thumbRadius * 0.15,
      eyePaint,
    );
    canvas.drawCircle(
      center + Offset(thumbRadius * 0.4, -thumbRadius * 0.2),
      thumbRadius * 0.15,
      eyePaint,
    );

    final mouthPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: thumbRadius * 0.5),
      0.2, // start angle
      2.8, // sweep angle
      false,
      mouthPaint,
    );
  }
}
