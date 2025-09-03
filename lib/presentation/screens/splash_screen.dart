import 'package:flutter/material.dart';
import 'package:pacifickode/presentation/widgets/custom_app_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Splash'),
      body: Center(child: Text('Splash')),
    );
  }
}
