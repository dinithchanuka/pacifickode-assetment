import 'package:pacifickode/domain/entities/job.dart';

abstract class JobRepository {
  Future<List<Job>> fetchJobs();
}
