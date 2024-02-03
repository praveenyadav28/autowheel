// import 'package:flutter/material.dart';


// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     List<e> items = [
//       e(
//         itemGroup: 1,
//         title: 2,
//         saleCertificate: 3,
//         unit: 4,
//         colour: 5,
//         vehicleGroup: 6,
//         ledgerGroup: 7,
//         labourGroup: 8,
//         serviceType: 9,
//         source: 10,
//         destination: 11,
//         department: 12,
//         state: 13,
//         bankMode: 14,
//         category: 15,
//         dealerCategory: 20,
//       ),
//     ];

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Model Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               for (var item in items)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Item Group: ${item.itemGroup}'),
//                     Text('Title: ${item.title}'),
//                     Text('Sale Certificate: ${item.saleCertificate}'),
//                     Text('Unit: ${item.unit}'),
//                     Text('Colour: ${item.colour}'),
//                     Text('Vehicle Group: ${item.vehicleGroup}'),
//                     Text('Ledger Group: ${item.ledgerGroup}'),
//                     Text('Labour Group: ${item.labourGroup}'),
//                     Text('Service Type: ${item.serviceType}'),
//                     Text('Source: ${item.source}'),
//                     Text('Destination: ${item.destination}'),
//                     Text('Department: ${item.department}'),
//                     Text('State: ${item.state}'),
//                     Text('Bank Mode: ${item.bankMode}'),
//                     Text('Category: ${item.category}'),
//                     Text('Dealer Category: ${item.dealerCategory}'),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
