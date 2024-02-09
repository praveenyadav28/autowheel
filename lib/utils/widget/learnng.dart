// // invoice_screen.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InvoiceScreen extends StatelessWidget {
//   final InvoiceController invoiceController = Get.put(InvoiceController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text('Total Spare: ${ }')),
//             Obx(() => Text('Total Labour: ${}')),
//             Obx(() => Text('IGST: ${}')),
//             Obx(() => Text(
//                 'Net Amount: ${}')),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => AddPartScreen());
//               },
//               child: Text('Add Part'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => AddLaborScreen());
//               },
//               child: Text('Add Labor'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddPartScreen extends StatelessWidget {
//   final InvoiceController invoiceController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Part Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Assuming the part price is 50 and GST is 5%
//                 double partPrice = 50;
//                 double gst = 0.05;

//                 invoiceController.addPart(partPrice, gst);
//                 Get.back(); // Go back to InvoiceScreen
//               },
//               child: Text('Save Part'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddLaborScreen extends StatelessWidget {
//   final InvoiceController invoiceController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Labor Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Assuming the labor price is 30 and GST is 5%
//                 double laborPrice = 30;
//                 double gst = 0.05;

//                 invoiceController.addLabor(laborPrice, gst);
//                 Get.back(); // Go back to InvoiceScreen
//               },
//               child: Text('Save Labor'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:get/get.dart';

class InvoiceController extends GetxController {
  RxDouble _totalSpare = 0.0.obs;
  RxDouble _totalLabour = 0.0.obs;
  RxDouble _totalGst = 0.0.obs;

  double get totalSpare => _totalSpare.value;
  double get totalLabour => _totalLabour.value;
  double get totalGst => _totalGst.value;

  void addPart(double partPrice, double gst) {
    _totalSpare.value += partPrice;
    _totalGst.value += partPrice * gst;
  }

  void addLabor(double laborPrice, double gst) {
    _totalLabour.value += laborPrice;
    _totalGst.value += laborPrice * gst;
  }
}
