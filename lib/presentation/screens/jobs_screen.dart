import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Jobs'),
      body: Center(child: Text('Jobs')),
    );
  }
}
