import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';

class InvoiceHistoryScreen extends StatefulWidget {
  const InvoiceHistoryScreen({super.key});

  @override
  State<InvoiceHistoryScreen> createState() => _InvoiceHistoryScreenState();
}

class _InvoiceHistoryScreenState extends State<InvoiceHistoryScreen> {
  final List<Map<String, dynamic>> data = [
    {
      'status': 'Approved',
      'amount': 'LKR 804',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150', //
    },
    {
      'status': 'Deposited',
      'amount': 'LKR 804',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'status': 'Pending',
      'amount': 'LKR 804',
      'adminName': 'Demo Admin',
      'superAdminName': 'Super Admin',
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final newData = data[index];
          return BuildTimelineLine(
            index: index,
            length: data.length,
            endChild: buildTimelineEvent(
                status: newData['status'],
                amount: newData['amount'],
                adminName: newData['adminName'],
                superAdminName: newData['superAdminName'],
                imageUrl: newData['imageUrl']),
          );
        },
      ),
    );
  }

  Widget buildTimelineEvent({
    required String status,
    required String amount,
    required String adminName,
    required String superAdminName,
    required String imageUrl,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
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
            // Amount Information
            Text(
              amount,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            // Admin Info with Image
            Row(
              children: [
                // Admin Image
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 16,
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
          ],
        ),
      ),
    );
  }
}
