import 'package:flutter/material.dart';

class XPBar extends StatelessWidget {
  final int points;
  final int maxPoints;

  const XPBar({super.key, required this.points, required this.maxPoints});

  @override
  Widget build(BuildContext context) {
    double progress = points / maxPoints;

    return Column(
      children: [
        Text('$points / $maxPoints XP', style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 5),
        Container(
          width: 100,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
