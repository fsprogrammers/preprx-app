import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preprx/view/auth/login_view.dart';
import 'package:preprx/view/auth/signup_view.dart';
import 'package:preprx/view/host/host_view.dart';
import 'package:preprx/view/study_zone/study_zone_all_topics.dart';
import 'package:preprx/view/study_zone/study_zone_pharmacology.dart';
import 'package:preprx/view/study_zone/study_zone_behavioral_health.dart';
import 'package:preprx/view/study_zone/study_zone_priority_practice.dart';
import 'package:preprx/view/study_zone/study_zone_custom_quiz.dart';
import 'package:preprx/view/studyoption/study_option_view.dart';
import 'package:preprx/view/splash/splash.dart';
import 'package:preprx/view/splash/splash2.dart';

class AppRoutes {
  static const splash = '/splash';
  static const splash2 = '/splash2';
  static const login = '/login';
  static const otp = '/otp';
  static const register = '/register';
  static const forgotPassword = '/forgot';
  static const forgotOtp = '/forgototp';
  static const resetPassword = '/resetpassword';
  static const studyOption = '/study-option';
  static const host = '/host';
  static const studyZoneALlTopics = '/study-zone-all-topics';
  static const studyZonePharmacology = '/study-zone-pharmacology';
  static const studyZoneBehavioralHealth = '/study-zone-behavioral-health';
  static const studyZonePriorityPractice = '/study-zone-priority-practice';
  static const studyZoneCustomQuiz = '/study-zone-custom-quiz';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (context, state) => SplashView()),
    GoRoute(
      path: AppRoutes.splash2,
      builder: (context, state) => SplashView2(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => SignupView(),
    ),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),
    GoRoute(
      path: AppRoutes.studyOption,
      builder: (context, state) => StudyOptionView(),
    ),
    GoRoute(path: AppRoutes.host, builder: (context, state) => HostView()),
    GoRoute(
      path: AppRoutes.studyZoneALlTopics,
      builder: (context, state) => StudyZoneALlTopicsView(),
    ),
    GoRoute(
      path: AppRoutes.studyZonePharmacology,
      builder: (context, state) => StudyZonePharmacologyView(),
    ),
    GoRoute(
      path: AppRoutes.studyZoneBehavioralHealth,
      builder: (context, state) => StudyZoneBehavioralHealthView(),
    ),
    GoRoute(
      path: AppRoutes.studyZonePriorityPractice,
      builder: (context, state) => StudyZonePriorityPracticeView(),
    ),
    GoRoute(
      path: AppRoutes.studyZoneCustomQuiz,
      builder: (context, state) => StudyZoneCustomQuizView(),
    ),
  ],
);
