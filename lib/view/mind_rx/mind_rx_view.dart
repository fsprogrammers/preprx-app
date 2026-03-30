import 'package:flutter/material.dart';
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
import 'package:preprx/view/home/widget/build_card.dart';

class MindRxView extends StatefulWidget {
  const MindRxView({super.key});

  @override
  State<MindRxView> createState() => _MindRxViewState();
}

class _MindRxViewState extends State<MindRxView> {
  double _moodValue = 0.5;

  @override
  Widget build(BuildContext context) {
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
                                      text: "Relexed",
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
                              child: _buildGridItem(
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
                              child: _buildGridItem(
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
                              child: _buildGridItem(
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
                              child: _buildGridItem(
                                icon: AppImages.calendar,
                                title: "Manifestation Calendar",
                                desc: "Gratitude, Reflection, Focus",
                                onTap: () {
                                  goRouter.push(AppRoutes.manifestationCalendar);
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
        onChanged: (value) {
          setState(() {
            _moodValue = value;
          });
        },
      ),
    );
  }

  Widget _buildGridItem({
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
            maxLine: 3,
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
