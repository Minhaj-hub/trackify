import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/order_model.dart';

class OrderRepository {
  final String baseUrl =
      'https://f29241f5-f851-445e-9dae-15b81982a2fc.mock.pstmn.io/orders';

  Future<List<Order>> getOrder() async {
    List<Order> orders = [];
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        // print('jsonResponse $jsonResponse');

        orders = jsonResponse.map((orderJson) {
          return Order.fromJson(orderJson);
        }).toList();

        return orders;
      } else {
        throw Exception('Failed to fetch order');
      }
    } catch (e) {
      // return [];
    }

    return orders;
  }

  filterOrders({required List<Order> ordersList, required String status}) {
    List<Order> orders =
        ordersList.where((order) => order.status == status).toList();
    return orders;
  }
}




// [
//   {
//     "orderNo": "CF303430",
//     "price": 3200,
//     "status":"confirmed",
//     "weight": 1.5,
//     "createdDate": "2024-02-10T00:00:00.000Z",
//     "merchant": {
//       "merchantId": "MC002",
//        "merchantName":"I phone store",
//       "pickupAddress": "123 Main St",
//       "originCity": "New York",
//       "originWarehouse": "Warehouse A"
//     },
//     "customer": {
//       "customerId": "0001",
//       "name": "John Doe",
//       "location": "456 Elm St",
//       "gmail": "john.doe@example.com",
//       "phone": "+1234567890",
//       "destCity": "Los Angeles",
//       "destWarehouse": "Warehouse B"
//     }
//   },
//   {
//     "orderNo": "CF303431",
//     "status":"Delivered",
//     "price": 3500,
//     "weight": 2.0,
//     "createdDate": "2024-02-11T00:00:00.000Z",
//     "merchant": {
//       "merchantId": "MC003",
//       "merchantName":"I phone store",
//       "pickupAddress": "456 Broadway",
//       "originCity": "San Francisco",
//       "originWarehouse": "Warehouse C"
//     },
//     "customer": {
//       "customerId": "0002",
//       "name": "Jane Doe",
//       "location": "789 Pine St",
//       "gmail": "jane.doe@example.com",
//       "phone": "+1234567891",
//       "destCity": "Chicago",
//       "destWarehouse": "Warehouse D"
//     }
//   }
// ]


// [{
//   "orderNo": "CF303430",
//   "status":"Delivered",
//   "price": 3200,
//   "weight": 1.5,
//   "createdDate": "2024-02-10T00:00:00.000Z",
//   "merchant": {
//     "merchantId": "MC002",
//     "merchantName":"Kapruka",
//     "pickupAddress": "123 Main St",
//     "originCity": "New York",
//     "originWarehouse": "Warehouse A"
//   },
//   "customer": {
//     "customerId": "0001",
//     "name": "John Doe",
//     "location": "456 Elm St",
//     "gmail": "john.doe@example.com",
//     "phone": "+1234567890",
//     "destCity": "Los Angeles",
//     "destWarehouse": "Warehouse B"
//   }
// },
// {
//   "orderNo": "CF303430",
//   "status":"Delivered",
//   "price": 3200,
//   "weight": 1.5,
//   "createdDate": "2024-02-10T00:00:00.000Z",
//   "merchant": {
//     "merchantId": "MC002",
//     "merchantName":"Kapruka",
//     "pickupAddress": "123 Main St",
//     "originCity": "New York",
//     "originWarehouse": "Warehouse A"
//   },
//   "customer": {
//     "customerId": "0001",
//     "name": "John Doe",
//     "location": "456 Elm St",
//     "gmail": "john.doe@example.com",
//     "phone": "+1234567890",
//     "destCity": "Los Angeles",
//     "destWarehouse": "Warehouse B"
//   }
// }

// ]