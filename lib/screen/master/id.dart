// import 'package:autowheelapp/models/hsnmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// class HsnScreen extends StatefulWidget {
//   const HsnScreen({Key? key}) : super(key: key);
//   @override
//   _HsnScreenState createState() => _HsnScreenState();
// }
// class _HsnScreenState extends State<HsnScreen> {
//   List<Websitmodal> hsnModels = [];
//   var HSN_ID;
//   String singleOutlet = "Single Outlet";
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     HsnIdScreenApi();
//   }

//   List<Websitmodal> get filteredHsnModels {
//     final query = searchController.text.toLowerCase();
//     return hsnModels.where((model) {
//       return model.hsnCode.toLowerCase().contains(query);
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   labelText: 'Search HSN Code',
//                 ),
//                 onChanged: (value) {
//                   setState(() {});
//                 },
//               ),
//               SizedBox(height: 16),
//               // Custom searchable dropdown
//               buildSearchableDropdown(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildSearchableDropdown() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButtonFormField(
//           value: null, // Set the value to null initially
//           decoration: InputDecoration.collapsed(hintText: ''),
//           items: filteredHsnModels.map((model) {
//             return DropdownMenuItem(
//               value: model,
//               child: Text(model.hsnCode),
//             );
//           }).toList(),
//           onChanged: (value) {
//             if (value != null && value is Websitmodal) {
//               singleOutlet = value.hsnCode;
//               HSN_ID = value.hsnId;
//               print('Selected HSN ID: $HSN_ID');
//               setState(() {});
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> HsnIdScreenApi() async {
//     print(1);
//     try {
//       final response = await http.get(Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetHSNMaster',
//       ));
//       print(2);
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         setState(() {
//           hsnModels = (jsonData as List)
//               .map((data) => Websitmodal.fromJson(data))
//               .toList();
//           print(3);
//         });
//       } else {
//         print('Failed to load data: ${response.statusCode}');
//       }
//       print(4);
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }

