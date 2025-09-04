import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacifickode/presentation/widgets/job_list_item.dart';

import '../providers/job_providers.dart';
import '../widgets/custom_app_bar.dart';

class JobsScreen extends ConsumerStatefulWidget {
  const JobsScreen({super.key});

  @override
  ConsumerState<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends ConsumerState<JobsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(jobNotifierProvider.notifier).fetchJobs());
  }

  @override
  Widget build(BuildContext context) {
    final jobState = ref.watch(jobNotifierProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'Jobs'),
      body: jobState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobState.errorMessage != null
          ? Center(child: Text(jobState.errorMessage!))
          : ListView.builder(
              itemCount: jobState.jobs.length,
              itemBuilder: (context, index) {
                return JobListItem(job: jobState.jobs[index]);
              },
            ),
    );
  }
}
