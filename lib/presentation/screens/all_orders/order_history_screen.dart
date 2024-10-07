import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Map<String, dynamic>> timelineEvents = [
    {
      'status': 'DELIVERED',
      'description': 'Collected COD Rs. 250.00. Rider: Test 09 Rider',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'status': 'ASSIGNED TO DESTINATION RIDER',
      'description': 'Collected COD Rs. 250.00. Rider: Test 09 Rider',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'status': 'RECEIVED TO ORIGIN WAREHOUSE',
      'description': 'Collected COD Rs. 250.00. Rider: Test 09 Rider',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'status': 'RECEIVED TO ORIGIN WAREHOUSE',
      'description': 'Collected COD Rs. 250.00. Rider: Test 09 Rider',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: timelineEvents.length,
              itemBuilder: (context, index) {
                final newData = timelineEvents[index];
                return BuildTimelineLine(
                    index: index,
                    length: newData.length,
                    endChild: buildTimelineEvent(
                      status: newData['status'],
                      description: newData['description'],
                      adminName: newData['adminName'],
                      imageUrl: newData['superAdminName'],
                      superAdminName: newData['imageUrl'],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimelineEvent({
    required String status,
    required String description,
    required String adminName,
    required String superAdminName,
    required String imageUrl,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Title
            Text(
              status,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            // Description
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            // Image and Admin Info
            Flexible(
              child: Row(
                children: [
                  // Admin Image
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  // Admin Names
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(adminName),
                      Text(
                        superAdminName,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
