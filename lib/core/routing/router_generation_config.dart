import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/screens/forgot_password_screen.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/screen/login_screen.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/screens/otp_verification_screen.dart';
import 'package:eureka/features/auth/presentation/screens/register_screen/screen/register_screen.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/screens/reset_password_screen.dart';
import 'package:eureka/features/main_layout/presentation/screens/main_layout_teacher_screen.dart';
import 'package:eureka/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:eureka/features/splach/presentation/screens/splash_screen.dart';
import 'package:eureka/features/teacher_home/presentation/screens/teacher_home_screen.dart';
import 'package:eureka/features/teacher_groups/presentation/screens/teacher_group_detail_screen.dart';
import 'package:eureka/features/teacher_groups/presentation/screens/teacher_add_group_screen.dart';
import 'package:eureka/features/teacher_students/presentation/screens/teacher_add_student_screen.dart';
import 'package:eureka/features/teacher_groups/presentation/screens/teacher_student_detail_screen.dart';
import 'package:eureka/features/teacher_groups/presentation/screens/teacher_edit_student_screen.dart';
import 'package:eureka/features/teacher_groups/presentation/screens/teacher_qr_code_screen.dart';
import 'package:eureka/features/teacher_subjects/presentation/screens/teacher_subjects_list_screen.dart';
import 'package:eureka/features/teacher_subjects/presentation/screens/teacher_units_screen.dart';
import 'package:eureka/features/teacher_subjects/presentation/screens/teacher_unit_detail_screen.dart';
import 'package:eureka/features/teacher_subjects/presentation/screens/teacher_lesson_detail_screen.dart';
import 'package:eureka/features/teacher_subjects/presentation/screens/teacher_video_detail_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_add_questions_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_create_task_basic_info_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_publish_task_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_select_task_type_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_set_task_schedule_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_task_detail_submissions_screen.dart';
import 'package:eureka/features/teacher_tasks/presentation/screens/teacher_tasks_home_screen.dart';
import 'package:eureka/features/teacher_notifications/presentation/screens/teacher_notification_details_screen.dart';
import 'package:eureka/features/teacher_notifications/presentation/screens/teacher_notification_form_screen.dart';
import 'package:eureka/features/teacher_notifications/presentation/screens/teacher_notifications_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => OnboardingScreen(
          onFinished: () => context.go(AppRoutes.loginScreen),
        ),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPasswordScreen,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerificationScreen,
        builder: (context, state) {
          final email = (state.extra is String)
              ? state.extra as String
              : 'ahmed@gmail.com';
          return OtpVerificationScreen(email: email);
        },
      ),
      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherHomeScreen,
        builder: (context, state) => const TeacherHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainLayoutScreen,
        builder: (context, state) => const MainLayoutScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherAddGroupScreen,
        builder: (context, state) => const TeacherAddGroupScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherGroupDetailScreen,
        builder: (context, state) {
          final groupName = (state.extra is String)
              ? state.extra as String
              : 'فيزياء أ';
          return TeacherGroupDetailScreen(groupName: groupName);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherStudentDetailScreen,
        builder: (context, state) {
          final studentName = (state.extra is String)
              ? state.extra as String
              : 'احمد السيد';
          return TeacherStudentDetailScreen(studentName: studentName);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherAddStudentScreen,
        builder: (context, state) => const TeacherAddStudentScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherEditStudentScreen,
        builder: (context, state) {
          final studentName = (state.extra is String)
              ? state.extra as String
              : 'احمد السيد';
          return TeacherEditStudentScreen(studentName: studentName);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherQrCodeScreen,
        builder: (context, state) => const TeacherQrCodeScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherSubjectsListScreen,
        builder: (context, state) => const TeacherSubjectsListScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherUnitsScreen,
        builder: (context, state) {
          final subjectName = (state.extra is String)
              ? state.extra as String
              : 'الرياضيات';
          return TeacherUnitsScreen(subjectName: subjectName);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherUnitDetailScreen,
        builder: (context, state) {
          final unitName = (state.extra is String)
              ? state.extra as String
              : 'الجبر';
          return TeacherUnitDetailScreen(unitName: unitName);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherLessonDetailScreen,
        builder: (context, state) {
          final lessonTitle = (state.extra is String)
              ? state.extra as String
              : 'المعادلات الخطية';
          return TeacherLessonDetailScreen(lessonTitle: lessonTitle);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherVideoDetailScreen,
        builder: (context, state) {
          final videoTitle = (state.extra is String)
              ? state.extra as String
              : 'شرح المعادلات للجزء الاول';
          return TeacherVideoDetailScreen(videoTitle: videoTitle);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherTasksHomeScreen,
        builder: (context, state) => const TeacherTasksHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherCreateTaskBasicInfoScreen,
        builder: (context, state) {
          final taskCategory = (state.extra is String)
              ? state.extra as String
              : 'واجب جديد';
          return TeacherCreateTaskBasicInfoScreen(taskCategory: taskCategory);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherSelectTaskTypeScreen,
        builder: (context, state) {
          final taskName = (state.extra is String)
              ? state.extra as String
              : 'واجب جديد';
          return TeacherSelectTaskTypeScreen(taskName: taskName);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherAddQuestionsScreen,
        builder: (context, state) {
          final questionType = (state.extra is String)
              ? state.extra as String
              : 'اختياري';
          return TeacherAddQuestionsScreen(questionType: questionType);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherSetTaskScheduleScreen,
        builder: (context, state) => const TeacherSetTaskScheduleScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherPublishTaskScreen,
        builder: (context, state) {
          final dueDate = (state.extra is String)
              ? state.extra as String
              : '25 مايو 2024';
          return TeacherPublishTaskScreen(dueDate: dueDate);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherTaskDetailSubmissionsScreen,
        builder: (context, state) {
          final taskTitle = (state.extra is String)
              ? state.extra as String
              : 'واجب الفيزياء الأول';
          return TeacherTaskDetailSubmissionsScreen(taskTitle: taskTitle);
        },
      ),
      GoRoute(
        path: AppRoutes.teacherNotificationsScreen,
        builder: (context, state) => const TeacherNotificationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherNotificationDetailsScreen,
        builder: (context, state) => TeacherNotificationDetailsScreen(
          notification: state.extra! as Map<String, dynamic>,
        ),
      ),
      GoRoute(
        path: AppRoutes.teacherNotificationFormScreen,
        builder: (context, state) => TeacherNotificationFormScreen(
          notification: state.extra is Map<String, dynamic>
              ? state.extra as Map<String, dynamic>
              : null,
        ),
      ),
    ],
  );
}
