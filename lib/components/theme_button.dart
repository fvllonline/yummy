import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.changeThemeMode,
  });

  final Function(bool) changeThemeMode;

  @override
  Widget build(BuildContext context) {
    final isIconLight = Theme.of(context).brightness == Brightness.light;

    return IconButton(
      icon: isIconLight
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
      onPressed: () => changeThemeMode(!isIconLight),
    );
  }
}
