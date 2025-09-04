import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacifickode/core/constants/searchType.dart';
import 'package:pacifickode/core/constants/strings.dart';
import 'package:pacifickode/presentation/widgets/job_list_item.dart';

import '../providers/job_providers.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_text_field.dart';

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
      appBar: CustomAppBar(title: AppStrings.labelJobs),
      body: Column(
        children: [
          SearchTextField(
            hintText: AppStrings.insSearchByTitle,
            searchType: SearchType.byTitle,
          ),
          Expanded(
            child: jobState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : jobState.errorMessage != null
                ? Center(child: Text(jobState.errorMessage!))
                : ListView.builder(
                    itemCount: jobState.favoriteJobs.length,
                    itemBuilder: (context, index) {
                      final job = jobState.favoriteJobs[index];
                      return JobListItem(job: job);
                    },
                  ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push('/favorites');
              },
              child: Text(AppStrings.labelFavJobs),
            ),
          ),
        ],
      ),
    );
  }
}
