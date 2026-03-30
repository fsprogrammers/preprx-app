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
import 'package:preprx/view/study_zone/study_zone_quiz_question.dart';
import 'package:preprx/view/study_zone/study_zone_flashcards.dart';
import 'package:preprx/view/study_zone/study_zone_view.dart';
import 'package:preprx/view/studyoption/study_option_view.dart';
import 'package:preprx/view/ask_michelle/ask_michelle_view.dart';
import 'package:preprx/view/ask_michelle/ask_michelle_chat_view.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_view.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_priority_framework.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_elimination.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_language_decoder.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_priority_patients.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_critical_thinking.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_flagged_questions.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_pharm_hacks.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_sata_bootcamp.dart';
import 'package:preprx/view/strategy_zone/strategy_zone_mindset.dart';
import 'package:preprx/view/community/motivation_monday_view.dart';
import 'package:preprx/view/community/study_buddy_requests_view.dart';
import 'package:preprx/view/community/create_study_request_view.dart';
import 'package:preprx/view/community/psych_nursing_tips_view.dart';
import 'package:preprx/view/community/ask_question_view.dart';
import 'package:preprx/view/mind_rx/visualization_room_view.dart';
import 'package:preprx/view/mind_rx/scripting_space_view.dart';
import 'package:preprx/view/mind_rx/subliminal_study_view.dart';
import 'package:preprx/view/mind_rx/manifestation_calendar_view.dart';
import 'package:preprx/view/mind_rx/add_affirmation_view.dart';
import 'package:preprx/view/progress/progress_view.dart';
import 'package:preprx/view/progress/treatment_plan_view.dart';
import 'package:preprx/view/profile/profile_view.dart';
import 'package:preprx/view/resources/resources_view.dart';
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
  static const studyZone = '/study-zone';
  static const studyZoneALlTopics = '/study-zone-all-topics';
  static const studyZonePharmacology = '/study-zone-pharmacology';
  static const studyZoneBehavioralHealth = '/study-zone-behavioral-health';
  static const studyZonePriorityPractice = '/study-zone-priority-practice';
  static const studyZoneCustomQuiz = '/study-zone-custom-quiz';
  static const studyZoneQuizQuestion = '/study-zone-quiz-question';
  static const studyZoneFlashcards = '/study-zone-flashcards';
  static const askMichelle = '/ask-michelle';
  static const askMichelleChat = '/ask-michelle-chat';
  static const strategyZone = '/strategy-zone';
  static const strategyZonePriorityFramework =
      '/strategy-zone-priority-framework';
  static const strategyZoneElimination = '/strategy-zone-elimination';
  static const strategyZoneLanguageDecoder = '/strategy-zone-language-decoder';
  static const strategyZonePriorityPatients =
      '/strategy-zone-priority-patients';
  static const strategyZoneCriticalThinking =
      '/strategy-zone-critical-thinking';
  static const strategyZoneFlaggedQuestions =
      '/strategy-zone-flagged-questions';
  static const strategyZonePharmHacks = '/strategy-zone-pharm-hacks';
  static const strategyZoneSataBootcamp = '/strategy-zone-sata-bootcamp';
  static const strategyZoneMindset = '/strategy-zone-mindset';
  static const motivationMonday = '/motivation-monday';
  static const studyBuddyRequests = '/study-buddy-requests';
  static const createStudyRequest = '/create-study-request';
  static const psychNursingTips = '/psych-nursing-tips';
  static const askQuestion = '/ask-question';
  static const visualizationRoom = '/visualization-room';
  static const scriptingSpace = '/scripting-space';
  static const subliminalStudy = '/subliminal-study';
  static const manifestationCalendar = '/manifestation-calendar';
  static const addAffirmation = '/add-affirmation';
  static const progress = '/progress';
  static const treatmentPlan = '/treatment-plan';
  static const resources = '/resources';
  static const profile = '/profile';
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
      path: AppRoutes.studyZone,
      builder: (context, state) => StudyZoneView(),
    ),
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
    GoRoute(
      path: AppRoutes.studyZoneQuizQuestion,
      builder: (context, state) => StudyZoneQuizQuestionView(),
    ),
    GoRoute(
      path: AppRoutes.studyZoneFlashcards,
      builder: (context, state) => StudyZoneFlashcardsView(),
    ),
    GoRoute(
      path: AppRoutes.askMichelle,
      builder: (context, state) => AskMichelleView(),
    ),
    GoRoute(
      path: AppRoutes.askMichelleChat,
      builder: (context, state) => AskMichelleChatView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZone,
      builder: (context, state) => StrategyZoneView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZonePriorityFramework,
      builder: (context, state) => StrategyZonePriorityFrameworkView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZoneElimination,
      builder: (context, state) => StrategyZoneEliminationView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZoneLanguageDecoder,
      builder: (context, state) => StrategyZoneLanguageDecoderView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZonePriorityPatients,
      builder: (context, state) => StrategyZonePriorityPatientsView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZoneCriticalThinking,
      builder: (context, state) => StrategyZoneCriticalThinkingView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZoneFlaggedQuestions,
      builder: (context, state) => StrategyZoneFlaggedQuestionsView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZonePharmHacks,
      builder: (context, state) => StrategyZonePharmHacksView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZoneSataBootcamp,
      builder: (context, state) => StrategyZoneSataBootcampView(),
    ),
    GoRoute(
      path: AppRoutes.strategyZoneMindset,
      builder: (context, state) => StrategyZoneMindsetView(),
    ),
    GoRoute(
      path: AppRoutes.motivationMonday,
      builder: (context, state) => MotivationMondayView(),
    ),
    GoRoute(
      path: AppRoutes.studyBuddyRequests,
      builder: (context, state) => StudyBuddyRequestsView(),
    ),
    GoRoute(
      path: AppRoutes.createStudyRequest,
      builder: (context, state) => CreateStudyRequestView(),
    ),
    GoRoute(
      path: AppRoutes.psychNursingTips,
      builder: (context, state) => PsychNursingTipsView(),
    ),
    GoRoute(
      path: AppRoutes.askQuestion,
      builder: (context, state) => AskQuestionView(),
    ),
    GoRoute(
      path: AppRoutes.visualizationRoom,
      builder: (context, state) => VisualizationRoomView(),
    ),
    GoRoute(
      path: AppRoutes.scriptingSpace,
      builder: (context, state) => ScriptingSpaceView(),
    ),
    GoRoute(
      path: AppRoutes.subliminalStudy,
      builder: (context, state) => SubliminalStudyView(),
    ),
    GoRoute(
      path: AppRoutes.manifestationCalendar,
      builder: (context, state) => ManifestationCalendarView(),
    ),
    GoRoute(
      path: AppRoutes.addAffirmation,
      builder: (context, state) => AddAffirmationView(),
    ),
    GoRoute(
      path: AppRoutes.progress,
      builder: (context, state) => ProgressView(),
    ),
    GoRoute(
      path: AppRoutes.treatmentPlan,
      builder: (context, state) => TreatmentPlanView(),
    ),
    GoRoute(
      path: AppRoutes.resources,
      builder: (context, state) => ResourcesView(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => ProfileView(),
    ),
  ],
);
