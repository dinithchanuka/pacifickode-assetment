import 'package:go_router/go_router.dart';

import '../domain/entities/job.dart';
import '../presentation/screens/favorites_screen.dart';
import '../presentation/screens/job_details_screen.dart';
import '../presentation/screens/jobs_screen.dart';
import '../presentation/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/jobs',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/jobs',
      name: 'jobs',
      builder: (context, state) => const JobsScreen(),
    ),
    GoRoute(
      path: '/job-details',
      name: 'job-details',
      builder: (context, state) {
        final job = state.extra as Job;
        return JobDetailsScreen(job: job);
      },
    ),
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
  ],
);
