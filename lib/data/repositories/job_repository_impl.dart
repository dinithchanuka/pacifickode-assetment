import 'package:pacifickode/domain/repositories/job_repository.dart';

import '../../domain/entities/job.dart';
import '../datasource/api_service.dart';

class JobRepositoryImpl implements JobRepository {
  final ApiService _apiService;

  JobRepositoryImpl(this._apiService);

  @override
  Future<List<Job>> fetchJobs() async {
    final jobs = await _apiService.fetchJobs();
    print("JobRepositoryImpl ------------------> ${jobs.length}");
    return jobs.map((job) => job as Job).toList();
  }
}
