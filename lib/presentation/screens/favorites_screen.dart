import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/strings.dart';
import '../providers/job_providers.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/job_list_item.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobState = ref.watch(jobNotifierProvider);
    final jobNotifier = ref.read(jobNotifierProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.labelFavJobs),
      body: jobState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobState.errorMessage != null
          ? Center(child: Text(jobState.errorMessage!))
          : ListView.builder(
              itemCount: jobNotifier.filteredJobs.length,
              itemBuilder: (context, index) {
                final job = jobNotifier.filteredJobs[index];
                return JobListItem(job: job);
              },
            ),
    );
  }
}
