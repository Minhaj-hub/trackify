class Merchant {
  final String merchantId;
  final String name;
  final String pickupAddress;
  final String originCity;
  final String originWarehouse;

  // Constructor
  Merchant({
    required this.merchantId,
    required this.name,
    required this.pickupAddress,
    required this.originCity,
    required this.originWarehouse,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      merchantId: json['merchantId'],
      name: json['merchantName'],
      pickupAddress: json['pickupAddress'],
      originCity: json['originCity'],
      originWarehouse: json['originWarehouse'],
    );
  }
}


// {
//   "orderNo": "CF303430",
//   "price": 3200,
//   "weight": 1.5,
//   "createdDate": "2024-02-10T00:00:00.000Z",
//   "merchant": {
//     "merchantId": "MC002",
//     "merchantName":"I phone store"
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

// [
//   {
//     "orderNo": "CF303430",
//     "status":"Confirmed",
//     "price": 3200,
//     "weight": 1.5,
//     "createdDate": "2024-02-10T00:00:00.000Z",
//     "merchant": {
//       "merchantId": "MC002",
//        "merchantName":"Samsung store",
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
//       "merchantName":"I phone store"
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