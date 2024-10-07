import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/model/order_model.dart';

predictColor(String status) {
  switch (status) {
    case 'Draft':
      return const Color(0xFFB0B0B0);
    case 'Confirmed':
      return const Color.fromARGB(255, 121, 154, 237);
    case 'Cancelled':
      return const Color.fromARGB(255, 228, 98, 78);
    case 'Delivered':
      return const Color.fromARGB(154, 106, 234, 187);
    case 'Partially Delivered':
      return const Color(0xFFFF9800);
    case 'Rescheduled':
      return const Color.fromARGB(255, 204, 74, 227);
    case 'Failure to Delivered':
      return const Color.fromARGB(255, 238, 36, 36);
    default:
      return const Color(0xFF000000);
  }
}

Future<void> createAndSaveExcel(List<Order> orders) async {
  // Create a new Excel document
  try {
    var excel = Excel.createExcel();
    Sheet sheet = excel['Sheet1'];

    sheet.appendRow([
      TextCellValue('Order No'),
      TextCellValue('status'),
      TextCellValue('price'),
      TextCellValue('weight'),
      TextCellValue('createdDate'),
      TextCellValue('merchantId'),
      TextCellValue('merchantName'),
      TextCellValue('pickupAddress'),
      TextCellValue('originCity'),
      TextCellValue('originWarehouse'),
      TextCellValue('customerId'),
      TextCellValue('name'),
      TextCellValue('location'),
      TextCellValue('gmail'),
      TextCellValue('phone'),
      TextCellValue('destCity'),
      TextCellValue('destWarehouse'),
    ]);

    for (int i = 0; i < orders.length; i++) {
      final orderNo = orders[i].orderNo;
      final status = orders[i].status;
      final price = orders[i].price;
      final weight = orders[i].weight;
      final createdDate = orders[i].createdDate;
      final merchantId = orders[i].merchant.merchantId;
      final merchantName = orders[i].merchant.name;
      final pickupAddress = orders[i].merchant.pickupAddress;
      final originCity = orders[i].merchant.originCity;
      final originWarehouse = orders[i].merchant.originWarehouse;
      final customerId = orders[i].customer.customerId;
      final customerName = orders[i].customer.name;
      final customerLocation = orders[i].customer.location;
      final customerGmail = orders[i].customer.gmail;
      final customerPhone = orders[i].customer.phone;
      final customerDescity = orders[i].customer.destCity;
      final customerDestWarehouse = orders[i].customer.destWarehouse;

      sheet.appendRow(
        [
          TextCellValue(orderNo),
          TextCellValue(status),
          TextCellValue('$price'),
          TextCellValue('$weight'),
          TextCellValue('$createdDate'),
          TextCellValue(merchantId),
          TextCellValue(merchantName),
          TextCellValue(pickupAddress),
          TextCellValue(originCity),
          TextCellValue(originWarehouse),
          TextCellValue(customerId),
          TextCellValue(customerName),
          TextCellValue(customerLocation),
          TextCellValue(customerGmail),
          TextCellValue(customerPhone),
          TextCellValue(customerDescity),
          TextCellValue(customerDestWarehouse)
        ],
      );
    }

    // Get the directory to save the file
    final directory = await getDownloadsDirectory();
    String filePath = "${directory!.path}/my_excel_file.xlsx";

    // Save the Excel file
    File file = File(filePath);
    await file.writeAsBytes(excel.encode()!);

    await Share.shareXFiles([XFile(filePath)],
        text: 'Check out my Excel file!');

    print('saved////// $filePath');
  } catch (e) {
    print(e);
  }
}

void showConfirmationDialog(BuildContext context, List<Order> order) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Action'),
        content: const Text(
            'Are you sure you want to create and download the Excel file?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              await createAndSaveExcel(order);
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}
