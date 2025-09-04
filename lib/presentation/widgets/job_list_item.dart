import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/job.dart';
import '../providers/job_providers.dart';

class JobListItem extends ConsumerWidget {
  final Job job;

  const JobListItem({required this.job, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => context.push('/job-details', extra: job),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(job.id, style: TextStyle(fontSize: 24)),
              SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(job.title, style: TextStyle(fontSize: 18)),
                      Text(' (${job.company})', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(children: [Text('${job.location} : '), Text(job.type)]),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () =>
                    ref.read(jobNotifierProvider.notifier).toggleFavorite(job),
                icon: Icon(
                  job.isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: job.isFavorite ? Colors.purpleAccent : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
