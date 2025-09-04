import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/job_repository.dart';
import 'job_stat.dart';

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
}

final jobNotifierProvider = StateNotifierProvider<JobNotifier, JobState>((ref) {
  throw UnimplementedError("JobRepository must be overridden");
});
