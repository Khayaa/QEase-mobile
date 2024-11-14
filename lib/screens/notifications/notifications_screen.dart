import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Queue Enrollment Confirmation',
      description: 'You have successfully enrolled in the queue for Service A.',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
    ),
    NotificationItem(
      title: 'Queue Status Update',
      description: 'Your position in the queue for Service B has been updated.',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationItem(
      title: 'Queue Reminder',
      description: 'Your turn is approaching for Service C. Please be ready.',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFF3F51B5),
      ),
      body: notifications.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      notification.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3F51B5),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0),
                        Text(
                          notification.description,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _formatTimestamp(notification.timestamp),
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                      onPressed: () {
                        // Delete notification logic
                      },
                    ),
                    onTap: () {
                      // Mark as read or navigate to detail if necessary
                    },
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'No new notifications',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
    );
  }

  // Format the timestamp to a more readable format
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}

// Notification model
class NotificationItem {
  final String title;
  final String description;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.description,
    required this.timestamp,
  });
}