// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class Demo extends StatefulWidget {
//   const Demo({super.key});

//   @override
//   State<Demo> createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => generatePDF(),
//           child: Text('Generate PDF'),
//         ),
//       ),
//     );
//   }
// }

// Future<void> generatePDF() async {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       build: (context) => pw.Column(
//         mainAxisAlignment: pw.MainAxisAlignment.center,
//         crossAxisAlignment: pw.CrossAxisAlignment.center,
//         children: [
//           pw.Text(
//             'Title',
//             style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold),
//           ),
//           pw.SizedBox(height: 10),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
//             children: [
//               pw.Container(
//                 color: PdfColor.fromInt(0xFF00FF00), // Green
//                 padding: pw.EdgeInsets.all(10),
//                 child: pw.Text('Green Box'),
//               ),
//               pw.Container(
//                 color: PdfColor.fromInt(0xFFFF0000), // Red
//                 padding: pw.EdgeInsets.all(10),
//                 child: pw.Text('Red Box'),
//               ),
//             ],
//           ),
//           pw.SizedBox(height: 20),
//           pw.ListView.builder(
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return pw.Container(
//                 margin: pw.EdgeInsets.symmetric(vertical: 10),
//                 child: pw.Text(
//                   'Item $index',
//                   style: pw.TextStyle(
//                     fontSize: 18,
//                     color: PdfColor.fromInt(0xFF000000 + 0x00FF0000 * index),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ),
//   );
//   final output = await Printing.layoutPdf(
//     onLayout: (format) async => pdf.save(),
//   );

//   final file = File('example.pdf');
//   await file.writeAsBytes(await pdf.save());

//   print('PDF saved to: ${file.path}');
// }

