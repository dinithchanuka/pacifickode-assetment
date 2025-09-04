import '../../domain/entities/job.dart';

class JobState {
  final List<Job> jobs;
  final List<Job> favoriteJobs;
  final bool isLoading;
  final String? errorMessage;
  final String searchQueryTitle;

  JobState({
    this.jobs = const [],
    this.favoriteJobs = const [],
    this.isLoading = false,
    this.errorMessage,
    this.searchQueryTitle = '',
  });

  JobState copyWith({
    List<Job>? jobs,
    List<Job>? favoriteJobs,
    bool? isLoading,
    String? errorMessage,
    String? searchQueryTitle,
  }) {
    return JobState(
      jobs: jobs ?? this.jobs,
      favoriteJobs: favoriteJobs ?? this.favoriteJobs,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      searchQueryTitle: searchQueryTitle ?? this.searchQueryTitle,
    );
  }
}
