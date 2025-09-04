import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final theme = ref.watch(themeModeProvider);
    final notifier = ref.read(themeModeProvider.notifier);

    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.dark_mode_rounded),
          onPressed: () {
            notifier.state = theme == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark;
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
