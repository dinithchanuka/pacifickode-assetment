import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacifickode/presentation/providers/job_providers.dart';
import 'package:pacifickode/routing/app_router.dart';

import 'core/providers/theme_provider.dart';
import 'core/theme/app_theme.dart';
import 'data/datasource/api_service.dart';
import 'data/datasource/local_data_source.dart';
import 'data/repositories/job_repository_impl.dart';

void main() {
  final apiService = ApiService();
  final jobRepository = JobRepositoryImpl(apiService);

  runApp(
    ProviderScope(
      overrides: [
        jobNotifierProvider.overrideWith(
          (ref) => JobNotifier(jobRepository, LocalDataSource()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Assessment Test ',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
