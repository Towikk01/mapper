import 'package:flutter/material.dart';

class RecentLocationsSection extends StatelessWidget {
  const RecentLocationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Locations',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(3, (index) {
            return ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: Text('Location ${index + 1}'),
              subtitle: const Text('Visited recently'),
            );
          }),
        ),
      ],
    );
  }
}
