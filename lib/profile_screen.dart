import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(width: 20),
              Text(
                'Your Name', // Mock User Name
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Divider(),
          _buildProfileInfoItem(
            context,
            icon: Icons.flag,
            label: 'Native Language',
            value: 'English', // Mock Data
          ),
          _buildProfileInfoItem(
            context,
            icon: Icons.school,
            label: 'Learning Language',
            value: 'Spanish', // Mock Data
          ),
          _buildProfileInfoItem(
            context,
            icon: Icons.calendar_today,
            label: 'Joined',
            value: 'October 2025', // Mock Data
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildProfileInfoItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Icon(icon, color: Colors.green),
      title: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(color: Colors.grey[600]),
      ),
      subtitle: Text(
        value,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
