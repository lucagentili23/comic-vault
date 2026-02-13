import 'package:comicvault/features/authentication/data/auth_repository.dart';
import 'package:comicvault/features/authentication/presentation/sign_in_screen.dart'; // Crealo vuoto per ora
import 'package:comicvault/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(Ref ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) return null;

      final isAuth = authState.value != null;

      final isLoggingIn = state.uri.path == '/login';

      if (isLoggingIn) {
        return isAuth ? '/' : null;
      }

      return isAuth ? null : '/login';
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/login',
        builder: (context, state) => const SignInScreen(),
      ),
    ],
  );
}
