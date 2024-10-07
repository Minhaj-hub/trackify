import 'package:flutter/material.dart';
import 'package:trackify/data/model/order_model.dart';
import 'package:trackify/presentation/widgets/custom_widgets.dart';

import '../../../utils/string.dart';

class ViewOrderDetailsScreen extends StatelessWidget {
  const ViewOrderDetailsScreen({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final orderNo = order.orderNo;
    final price = order.price;
    final weight = order.weight;
    final createdDate = order.createdDate;

    final merchant = order.merchant;
    final merchantName = merchant.name;
    final merchantId = merchant.merchantId;
    final pickupAddress = merchant.pickupAddress;
    final originCity = merchant.originCity;
    final originWarehouse = merchant.originWarehouse;

    final customer = order.customer;
    final cusName = customer.name;
    final cuslocation = customer.location;
    final cusgmail = customer.gmail;
    final cusphone = customer.phone;
    final cusdestCity = customer.destCity;
    final cusdestWarehouse = customer.destWarehouse;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Center(child: CText(txt: 'View Order Details')),
                ),
                Row(
                  children: [
                    // Timeline Column
                    Column(
                      children: [
                        _buildTimelineDot(),
                        _buildTimelineLine(),
                        _buildTimelineDot(),
                        _buildTimelineLine(),
                        _buildTimelineDot(),
                        _buildTimelineLine(),
                        _buildTimelineDot(),
                        _buildTimelineLine(),
                        _buildTimelineDot(),
                      ],
                    ),
                    const SizedBox(width: 8),

                    // Main Details Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOrderHeader(
                              orderNo, price, weight, createdDate),
                          const SizedBox(height: 16),
                          _buildSectionTitle('Merchant Details'),
                          _buildSectionContent(
                            '$merchantName\nMC-0002\nPickup Address:$pickupAddress\nOrigin City: $originCity\nOrigin Warehouse: $originWarehouse',
                          ),
                          const SizedBox(height: 16),
                          _buildSectionTitle('Customer Details'),
                          _buildSectionContent(
                            '$cusName\n$cuslocation\n$cuslocation\n$cusphone\nDestination City: $cusdestCity\nDestination Warehouse: $cusdestWarehouse',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Timeline dot
  Widget _buildTimelineDot() {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        shape: BoxShape.circle,
      ),
    );
  }

  // Timeline line
  Widget _buildTimelineLine() {
    return Container(
      width: 2,
      height: 100,
      color: Colors.lightBlue,
    );
  }

  // Order Header with the box-like UI element
  Widget _buildOrderHeader(
    orderNo,
    price,
    weight,
    createdDate,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(invoice),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderNo,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text('COD: Rs.$price'),
                Text('Weight: $weight Kg'),
                Text('Created on: $createdDate'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  // Section Content
  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 14, height: 1.5),
      ),
    );
  }
}



//  {
//     "orderNo": "Parallex-01",
//     "status":"Delivered"
//     "price": 3200,
//     "weight": 1.5,
//     "createdDate": "22/09/2024 18:45",
//     "merchant": {
//       "merchantId": "Kapruka-5AB960",
//       "pickupAddress": "No:56,Kawdana Road",
//       "originCity": "Dehiwala",
//       "originWarehouse": "Warehouse A"
//     },
//     "customer": {
//       "customerId": "0001",
//       "name": "Sampath",
//       "location": "Negombu",
//       "gmail": "Sampath.doe@example.com",
//       "phone": "+947546895234",
//       "destCity": "Negombu",
//       "destWarehouse": "Warehouse B"
//     }
//   },

// [
//     {
//         "orderNo": "Parallex-01",
//         "status": "Delivered",
//         "price": 3200,
//         "weight": 1.5,
//         "createdDate": "22/09/2024 18:45",
//         "merchant": {
//             "merchantId": "Kapruka-1A",
//             "merchantName": "Kapruka",
//             "pickupAddress": "No:56, Kawdana Road",
//             "originCity": "Dehiwala",
//             "originWarehouse": "Warehouse A"
//         },
//         "customer": {
//             "customerId": "0001",
//             "name": "Sampath",
//             "location": "Negombo",
//             "gmail": "Sampath.doe@example.com",
//             "phone": "+947546895234",
//             "destCity": "Negombo",
//             "destWarehouse": "Warehouse B"
//         }
//     },
//     {
//         "orderNo": "Parallex-02",
//         "status": "Cancelled",
//         "price": 4200,
//         "weight": 1.8,
//         "createdDate": "23/09/2024 09:30",
//         "merchant": {
//             "merchantId": "Daraz-2B",
//             "merchantName": "Daraz",
//             "pickupAddress": "No:24, Market Road",
//             "originCity": "Colombo",
//             "originWarehouse": "Warehouse C"
//         },
//         "customer": {
//             "customerId": "0002",
//             "name": "Priya",
//             "location": "Colombo",
//             "gmail": "priya.colombo@example.com",
//             "phone": "+94785578912",
//             "destCity": "Colombo",
//             "destWarehouse": "Warehouse D"
//         }
//     }]