import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_assets.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class TreatmentPlanView extends StatefulWidget {
  const TreatmentPlanView({super.key});

  @override
  State<TreatmentPlanView> createState() => _TreatmentPlanViewState();
}

class _TreatmentPlanViewState extends State<TreatmentPlanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(
                  isSearch: false,
                  isProfile: true,
                  isBack: true,
                ),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        // Title Card
                        buildCard(
                          child: Center(
                            child: customText(
                              text: "Treatment plan progress",
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.charcoal,
                            ),
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Progress Over Time Card
                        _buildProgressOverTimeCard(),
                        verticalSpacer(height: 24),

                        // Milestone Card Title
                        buildCard(
                          child: Center(
                            child: customText(
                              text:
                                  "Study progress- every dose bring you closer",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.charcoal,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        verticalSpacer(height: 12),
                        _buildMilestoneCard(),
                        verticalSpacer(height: 24),

                        // Subject Mastery Section
                        _buildSubjectMasterySection(),
                        verticalSpacer(height: 24),

                        // Mind Rx Tracker Card
                        _buildMindRxTrackerCard(),
                        verticalSpacer(height: 24),

                        // Question Analytics Card
                        _buildQuestionAnalyticsCard(),
                        verticalSpacer(height: 24),

                        // Weak Area Tracker Card
                        _buildWeakAreaTrackerCard(),
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

  Widget _buildProgressOverTimeCard() {
    return buildCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                text: "Progress Over Time",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.charcoal,
              ),
              Row(
                children: [
                  Icon(Icons.arrow_drop_up, color: Colors.green, size: 24.sp),
                  customText(
                    text: "Increasing",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
          verticalSpacer(height: 32),
          SizedBox(
            height: 150.h,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(250.w, 150.h),
                  painter: ArcPainter(progress: 0.72),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    verticalSpacer(height: 40),
                    customText(
                      text: "You’re",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.charcoal,
                    ),
                    customText(
                      text: "72%",
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: const Color(0xFF00A5B7),
                    ),
                    customText(
                      text: "To full Confidence",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.bodytext,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneCard() {
    return buildCard(
      child: Column(
        children: [
          _buildMilestoneItem(AppImages.milestone, "Milestone Streaks"),
          verticalSpacer(height: 12),
          _buildMilestoneItem(AppImages.streak, "10 day study streak"),
          verticalSpacer(height: 12),
          _buildMilestoneItem(AppImages.questions, "500 questions completed"),
        ],
      ),
    );
  }

  Widget _buildMilestoneItem(String icon, String title) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
          height: 30.h,
          child: SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              AppColors.gold,
              BlendMode.srcIn,
            ),
          ),
        ),
        horizontalSpacer(width: 16),
        customText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: AppColors.charcoal,
        ),
      ],
    );
  }

  Widget _buildSubjectMasterySection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: BorderRadius.circular(26.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: "Subject Mastery",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
          verticalSpacer(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 2.sp,
            children: [
              _buildSubjectItem(AppImages.medsurg, "Med-Surg", "80%"),
              _buildSubjectItem(AppImages.pharma, "Pharma.", "80%"),
              _buildSubjectItem(AppImages.behavior, "Pediatrics", "80%"),
              _buildSubjectItem(AppImages.brain, "Psych", "80%"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectItem(String icon, String title, String percentage) {
    return Container(
      width: 70.w,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              AppColors.teal,
              BlendMode.srcIn,
            ),
          ),
          verticalSpacer(height: 8),
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: AppColors.charcoal,
            textAlign: TextAlign.center,
          ),
          customText(
            text: percentage,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: AppColors.charcoal,
          ),
        ],
      ),
    );
  }

  Widget _buildMindRxTrackerCard() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                text: "Mind Rx Tracker",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.charcoal,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLegend(const Color(0xFF00A5B7), "Mood"),
                  _buildLegend(const Color(0xFFD5308B), "Study Consistency"),
                ],
              ),
            ],
          ),
          verticalSpacer(height: 32),
          SizedBox(
            height: 120.h,
            width: double.infinity,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 4),
                      FlSpot(2, 2),
                      FlSpot(3, 5),
                      FlSpot(4, 4.5),
                      FlSpot(5, 5.5),
                      FlSpot(6, 3),
                    ],
                    isCurved: true,
                    color: const Color(0xFF00A5B7),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 2),
                      FlSpot(1, 3.5),
                      FlSpot(2, 2.5),
                      FlSpot(3, 3),
                      FlSpot(4, 3.5),
                      FlSpot(5, 3),
                      FlSpot(6, 2),
                    ],
                    isCurved: true,
                    color: const Color(0xFFD5308B),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Mon", "Tue", "Sat", "Wed", "Thu", "Fri", "Sun"]
                .map(
                  (day) => customText(
                    text: day,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.charcoal,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 8.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        horizontalSpacer(width: 8),
        customText(
          text: text,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.primaryGrey,
        ),
      ],
    );
  }

  Widget _buildQuestionAnalyticsCard() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: "Question Analytics",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 20),
          _buildAnalyticRow("Answered", "2,350"),
          verticalSpacer(height: 8),
          _buildAnalyticRow("Accuracy", "78%"),
          verticalSpacer(height: 8),
          _buildAnalyticRow("Average time/Q", "34 sec"),
        ],
      ),
    );
  }

  Widget _buildAnalyticRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: AppColors.bodytext,
        ),
        customText(
          text: value,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: AppColors.charcoal,
        ),
      ],
    );
  }

  Widget _buildWeakAreaTrackerCard() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: "Weak area tracker",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 16),
          Center(
            child: Column(
              children: [
                customText(
                  text: "FLUID & ELECTROLYTES",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.magenta,
                ),
                verticalSpacer(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      text: "Accuracy",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.bodytext,
                    ),
                    horizontalSpacer(width: 60),
                    customText(
                      text: "52%",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.charcoal,
                    ),
                  ],
                ),
                verticalSpacer(height: 20),
                SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.teal,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: customText(
                      text: "Review",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress;
  ArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = AppColors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.gold, AppColors.gold],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      bgPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * progress,
      false,
      progressPaint,
    );

    // Draw the dot at the end of progress
    final dotAngle = math.pi + (math.pi * progress);
    final dotX = center.dx + radius * math.cos(dotAngle);
    final dotY = center.dy + radius * math.sin(dotAngle);

    final dotPaint = Paint()
      ..color = AppColors.gold
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(dotX, dotY), 14, dotPaint);
    canvas.drawCircle(
      Offset(dotX, dotY),
      15,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
