import 'package:eureka/core/routing/app_routes.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/screens/forgot_password_screen.dart';
import 'package:eureka/features/auth/presentation/screens/login_screen/widgets/screen/login_screen.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/screens/otp_verification_screen.dart';
import 'package:eureka/features/auth/presentation/screens/register_screen/screen/register_screen.dart';
import 'package:eureka/features/auth/presentation/screens/forgot_password/screens/reset_password_screen.dart';
import 'package:eureka/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:eureka/features/splach/presentation/screens/splash_screen.dart';
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
          final email = state.extra as String? ?? 'ahmed@gmail.com';
          return OtpVerificationScreen(email: email);
        },
      ),
      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
    ],
  );
}
