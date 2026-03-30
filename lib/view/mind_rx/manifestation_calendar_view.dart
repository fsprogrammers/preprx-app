import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_drawer.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/home/widget/build_card.dart';

class ManifestationCalendarView extends StatefulWidget {
  const ManifestationCalendarView({super.key});

  @override
  State<ManifestationCalendarView> createState() =>
      _ManifestationCalendarViewState();
}

class _ManifestationCalendarViewState extends State<ManifestationCalendarView> {
  DateTime selectedDate = DateTime(2025, 11, 12);
  DateTime currentMonth = DateTime(2025, 11);
  final List<int> highlightedDates = [12, 15, 20, 23];

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
                child: customAppBar(isSearch: false, isBack: true),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      children: [
                        // Header Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Manifestation Calendar",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text:
                                    "Small daily moments that shift your mindset.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        // Calendar Card
                        _buildCalendarCard(),

                        verticalSpacer(height: 24),

                        // Affirmation Card
                        buildCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Affirmation at this date",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text: _getAffirmation(selectedDate),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.charcoal,
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(height: 32),

                        // Add Affirmation Button
                        SizedBox(
                          width: double.infinity,
                          height: 54.h,
                          child: ElevatedButton(
                            onPressed: () {
                              goRouter.push(AppRoutes.addAffirmation);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gold,
                              foregroundColor: AppColors.charcoal,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: customText(
                              text: "Add Affirmation",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.charcoal,
                            ),
                          ),
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

  String _getAffirmation(DateTime date) {
    if (date.day == 12) return "I am capable, calm and ready to go";
    if (date.day == 15) return "I trust the process of my growth";
    if (date.day == 20) return "My focus is my superpower";
    if (date.day == 23) return "Every step forward is a victory";
    return "Click a highlighted date for your daily affirmation";
  }

  Widget _buildCalendarCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Calendar Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            color: AppColors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month - 1,
                      );
                    });
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
                Column(
                  children: [
                    customText(
                      text:
                          _getMonthName(currentMonth.month) +
                          " ${currentMonth.year}",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    customText(
                      text: _getWeekdayName(selectedDate.weekday),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month + 1,
                      );
                    });
                  },
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),

          // Days of week
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ["S", "M", "T", "W", "T", "F", "S"]
                      .map(
                        (day) => Expanded(
                          child: Center(
                            child: customText(
                              text: day,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.charcoal,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                verticalSpacer(height: 16),
                _buildCalendarGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }

  String _getWeekdayName(int weekday) {
    const weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return weekdays[weekday - 1];
  }

  List<int?> _generateCalendarDays(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

    final List<int?> days = [];

    // Previous month padding
    for (int i = 0; i < firstDayOfMonth.weekday % 7; i++) {
      days.insert(
        0,
        null,
      ); // Use null for empty start spaces to match current implementation
    }

    // Current month days
    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      days.add(i);
    }

    // Post-month padding (optional, but good for consistent grid)
    final totalCells = ((days.length / 7).ceil() * 7);
    int nextMonthDay = 1;
    while (days.length < totalCells || days.length < 35) {
      days.add(nextMonthDay++);
    }

    return days;
  }

  Widget _buildCalendarGrid() {
    final List<int?> days = _generateCalendarDays(currentMonth);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 16,
        crossAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final day = days[index];
        if (day == null) return const SizedBox.shrink();

        // Logic to determine if it's current month or next/prev padding
        bool isCurrentMonth = false;
        // Simplistic check for the demo: if day is small and index is large, it's next month
        if (index > 25 && day < 10) {
          isCurrentMonth = false;
        } else {
          isCurrentMonth = true;
        }

        bool isHighlighted = highlightedDates.contains(day) && isCurrentMonth;
        bool isSelected =
            selectedDate.day == day &&
            selectedDate.month == currentMonth.month &&
            selectedDate.year == currentMonth.year &&
            isCurrentMonth;

        return GestureDetector(
          onTap: () {
            if (isCurrentMonth) {
              setState(() {
                selectedDate = DateTime(
                  currentMonth.year,
                  currentMonth.month,
                  day,
                );
              });
            }
          },
          child: Center(
            child: Container(
              width: 32.w,
              height: 32.h,
              alignment: Alignment.center,
              decoration: isSelected
                  ? BoxDecoration(
                      border: Border.all(color: AppColors.gold, width: 1.5),
                      borderRadius: BorderRadius.circular(8.r),
                    )
                  : null,
              child: customText(
                text: day.toString(),
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: isHighlighted
                    ? AppColors.gold
                    : !isCurrentMonth
                    ? AppColors.charcoal.withValues(alpha: 0.5)
                    : AppColors.charcoal,
              ),
            ),
          ),
        );
      },
    );
  }
}
