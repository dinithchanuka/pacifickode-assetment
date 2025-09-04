import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/local_data_source.dart';
import '../../domain/entities/job.dart';
import '../../domain/repositories/job_repository.dart';
import 'job_state.dart';

class JobNotifier extends StateNotifier<JobState> {
  final JobRepository jobRepository;
  final LocalDataSource localDataSource;

  JobNotifier(this.jobRepository, this.localDataSource) : super(JobState());

  Future<void> fetchJobs() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final jobs = await jobRepository.fetchJobs();

      final favIds = await localDataSource.getFavoriteIds();

      for (final job in jobs) {
        if (favIds.contains(job.id)) {
          job.isFavorite = true;
        }
      }

      final favJobs = jobs.where((favJobs) => favJobs.isFavorite).toList();

      state = state.copyWith(
        jobs: jobs,
        favoriteJobs: favJobs,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void updateSearchQueryTitle(String query) {
    state = state.copyWith(searchQueryTitle: query);
  }

  List<Job> get filteredJobs {
    if (state.searchQueryTitle.isEmpty) {
      return state.jobs;
    } else {
      return state.jobs
          .where(
            (job) => job.title.toLowerCase().contains(
              state.searchQueryTitle.toLowerCase(),
            ),
          )
          .toList();
    }
  }

  Future<void> toggleFavorite(Job job) async {
    job.isFavorite = !job.isFavorite;

    final updatedJob = [...state.jobs];
    final updatedFavJobs = updatedJob
        .where((favJobs) => favJobs.isFavorite)
        .toList();

    state = state.copyWith(jobs: updatedJob, favoriteJobs: updatedFavJobs);

    final ids = updatedJob.map((job) => job.id).toList();
    await localDataSource.saveFavoriteIds(ids);
  }
}

final jobNotifierProvider = StateNotifierProvider<JobNotifier, JobState>((ref) {
  throw UnimplementedError("JobRepository must be overridden");
});
