import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pacifickode/core/constants/strings.dart';
import 'package:pacifickode/domain/entities/job.dart';

import '../widgets/custom_app_bar.dart';

class JobDetailsScreen extends StatelessWidget {
  final Job job;

  const JobDetailsScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.labelJobDetails),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(job.title, style: TextStyle(fontSize: 24)),
              Text(job.company, style: TextStyle(fontSize: 20)),
              Text(job.location),
              Text(job.type),
              Text(job.salary),
              SizedBox(height: 16),
              Text(job.description),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Applied to ${job.title}')),
                    );
                    context.pop();
                  },
                  child: Text(AppStrings.labelApply),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
