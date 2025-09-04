import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/job.dart';
import '../../domain/repositories/job_repository.dart';
import 'job_state.dart';

class JobNotifier extends StateNotifier<JobState> {
  final JobRepository jobRepository;

  JobNotifier(this.jobRepository) : super(JobState());

  Future<void> fetchJobs() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final jobs = await jobRepository.fetchJobs();
      state = state.copyWith(jobs: jobs, isLoading: false);
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
}

final jobNotifierProvider = StateNotifierProvider<JobNotifier, JobState>((ref) {
  throw UnimplementedError("JobRepository must be overridden");
});
