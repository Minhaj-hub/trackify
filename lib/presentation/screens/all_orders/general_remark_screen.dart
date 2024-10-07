import 'package:flutter/material.dart';

import 'package:trackify/presentation/widgets/custom_widgets.dart';

class GeneralRemarkScreen extends StatefulWidget {
  const GeneralRemarkScreen({super.key});

  @override
  State<GeneralRemarkScreen> createState() => _GeneralRemarkScreenState();
}

class _GeneralRemarkScreenState extends State<GeneralRemarkScreen> {
  final List<Map<String, dynamic>> remarks = [
    {
      'remarkedBy': 'Mr. John Deo',
      'remark': 'Stock sold out',
      'tags': 'No Specified Tags',
      'remarkDate': '08/06/2023 20:28',
      'readBy': '1',
    },
    {
      'remarkedBy': 'Mr. Emma Deo',
      'remark': 'Stock sold out',
      'tags': 'No Specified Tags',
      'remarkDate': '04/06/2023 20:28',
      'readBy': '2',
    },
    {
      'remarkedBy': 'Mr. John Deo',
      'remark': 'Stock sold out',
      'tags': 'No Specified Tags',
      'remarkDate': '11/06/2023 20:28',
      'readBy': '2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Tabs (Order History, Invoice History, General Remark)
          Expanded(
            child: ListView.builder(
              itemCount: remarks.length,
              itemBuilder: (context, index) {
                final remark = remarks[index];
                return BuildTimelineLine(
                  index: index,
                  length: remarks.length,
                  endChild: _buildRemarkCard(remark),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildTimelineTile(
  //     Map<String, dynamic> remark, int index, int length) {
  //   return TimelineTile(
  //     alignment: TimelineAlign.manual,
  //     lineXY: 0.05,
  //     isFirst: index == 0,
  //     isLast: index == length - 1,
  //     indicatorStyle: const IndicatorStyle(
  //       width: 20,
  //       color: Colors.blue,
  //       // padding: EdgeInsets.all(8),
  //     ),
  //     beforeLineStyle: const LineStyle(
  //       color: Colors.blue,
  //       thickness: 2,
  //     ),
  //     afterLineStyle: const LineStyle(
  //       color: Colors.blue,
  //       thickness: 2,
  //     ),
  //     endChild: _buildRemarkCard(remark),
  //   );
  // }

  Widget _buildRemarkCard(Map<String, dynamic> remark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRemarkRow('Remarked By', remark['remarkedBy']),
              const SizedBox(height: 8.0),
              _buildRemarkRow('Remark', remark['remark']),
              const SizedBox(height: 8.0),
              _buildRemarkRow('Tags', remark['tags'], isTag: true),
              const SizedBox(height: 8.0),
              _buildRemarkRow('Remark Date', remark['remarkDate']),
              const SizedBox(height: 8.0),
              _buildRemarkRow('Read By', remark['readBy']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRemarkRow(String label, String value, {bool isTag = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: isTag
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : Text(value),
        ),
      ],
    );
  }
}
