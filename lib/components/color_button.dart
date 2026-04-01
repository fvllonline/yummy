import 'package:flutter/material.dart';
import '../constants.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    required this.changeColor,
    required this.colorSelected,
  });

  final Function(int) changeColor;
  final ColorSelection colorSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.palette_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: changeColor,
      itemBuilder: (context) {
        return ColorSelection.values.map((colorSelection) {
          return PopupMenuItem<int>(
            value: colorSelection.index,
            child: Row(
              children: [
                Icon(
                  Icons.opacity_rounded,
                  color: colorSelection.color,
                ),
                const SizedBox(width: 10),
                Text(colorSelection.label),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
