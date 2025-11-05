import 'package:flutter/material.dart';

class FindPartnerScreen extends StatelessWidget {
  const FindPartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for the list
    final List<Map<String, String>> partners = [
      {'name': 'Maria', 'native': 'Spanish', 'learning': 'English'},
      {'name': 'Kenji', 'native': 'Japanese', 'learning': 'French'},
      {'name': 'Ahmed', 'native': 'Arabic', 'learning': 'English'},
      {'name': 'Chloe', 'native': 'French', 'learning': 'Japanese'},
      {'name': 'David', 'native': 'English', 'learning': 'Spanish'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Available Partners')),
      body: ListView.builder(
        itemCount: partners.length,
        itemBuilder: (context, index) {
          final partner = partners[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(partner['name']![0]), // First initial
              ),
              title: Text(
                partner['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Native: ${partner['native']} | Learning: ${partner['learning']}',
              ),
              trailing: const Icon(Icons.message_outlined),
              onTap: () {
                // Mock action: show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Starting conversation with ${partner['name']}...',
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
