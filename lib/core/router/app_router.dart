import 'package:comicvault/core/router/go_router_refresh_stream.dart';
import 'package:comicvault/features/authentication/data/auth_repository.dart';
import 'package:comicvault/features/authentication/presentation/sign_in_screen.dart';
import 'package:comicvault/features/home/presentation/home_screen.dart';
import 'package:comicvault/features/onboarding/data/onboarding_repository.dart'; // Importa il repo
import 'package:comicvault/features/onboarding/presentation/welcome_screen.dart'; // Importa la screen
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final isOnboardingComplete = onboardingRepository.isOnboardingComplete();

      final isGoingToLogin = state.uri.toString() == '/login';
      final isGoingToWelcome = state.uri.toString() == '/welcome';

      if (!isOnboardingComplete && !isGoingToWelcome) {
        return '/welcome';
      }

      if (isOnboardingComplete && isGoingToWelcome) {
        return '/login';
      }

      if (isOnboardingComplete && !isLoggedIn && !isGoingToLogin) {
        return '/login';
      }

      if (isLoggedIn && (isGoingToLogin || isGoingToWelcome)) {
        return '/';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges),
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/login',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
    ],
  );
}
