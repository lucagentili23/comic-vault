import 'package:comicvault/core/router/app_router.dart';
import 'package:comicvault/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComicVaultApp extends ConsumerWidget {
  const ComicVaultApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: "Comic vault",
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
