// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: body_might_complete_normally_nullable, unused_local_variable
// import 'dart:convert';
// import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// // ignore: unused_import
// import 'package:autowheelapp/labour/domiscreen.dart';
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/color/widget/widget.dart';

// class addpartsScreen extends StatefulWidget {
//   const addpartsScreen({
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<addpartsScreen> createState() => _addpartsScreenState();
// }

// final key = GlobalKey<FormState>();
// var h, w;

// class _addpartsScreenState extends State<addpartsScreen> {
//   TextEditingController workDiscController = TextEditingController();
//   TextEditingController hsnCodeController = TextEditingController();
//   TextEditingController quantityController = TextEditingController();
//   TextEditingController amtController = TextEditingController();
//   TextEditingController gstController = TextEditingController();
//   TextEditingController salePriceController = TextEditingController();
//   List<Widget> containers = [];
//   @override
//   void dispose() {
//     workDiscController.dispose();
//     quantityController.dispose();
//     amtController.dispose();
//     salePriceController.dispose();
//     super.dispose();
//   }

//   List<Item> hsnModels = [];
//   String singleoutlate1 = "Single Outlet";

//   @override
//   void initState() {
//     super.initState();
//     purchaesspartDeta();
//   }

//   @override
//   Widget build(BuildContext context) {
//     w = MediaQuery.of(context).size.width;
//     h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//           leading: BackButton(color: AppColor.kBlack),
//           toolbarHeight: 30,
//           centerTitle: true,
//           title: Text("Prchease part"),
//           backgroundColor: AppColor.kappabrcolr),
//       body: SingleChildScrollView(
//         child: Form(
//           key: key,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: DropdownButtonFormField(
//                           value: hsnModels.first.itemName.toString(),
//                           //  hsnModels.isNotEmpty ? hsnModels.first.hsnCode.toString() : null,

//                           // value: hsnModels.isNotEmpty
//                           //     ? hsnModels.first.hsnCode.toString()
//                           //     : null,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 1, color: AppColor.kGray),
//                             ),
//                             hintText: 'Select Hsn Code',
//                             contentPadding: EdgeInsets.all(5),
//                           ),
//                           dropdownColor:
//                               const Color.fromARGB(255, 211, 247, 212),
//                           icon: Icon(
//                             Icons.keyboard_arrow_down_outlined,
//                             size: 24,
//                             color: Colors.black,
//                           ),
//                           isExpanded: true,
//                           items: hsnModels.map((model) {
//                             return DropdownMenuItem(
//                               value: model.itemName.toString(),
//                               //  hsnModels.isNotEmpty
//                               //     ? hsnModels.first.hsnCode.toString()
//                               //     : null,

//                               // value: model.hsnCode,
//                               child:
//                                   Text('${model.itemId} - ${model.itemName}'),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             singleoutlate1 = value.toString();

//                             // Find the selected model by comparing the item name
//                             Item selectedModel = hsnModels
//                                 .firstWhere((model) => model.itemName == value);

//                             // Update the text fields with the selected model's values
//                             // hsnCodeController.text =
//                             //     selectedModel.hsnCode.toString();
//                             // workDiscController.text =
//                             //     selectedModel.itemDes.toString();
//                             // gstController.text = selectedModel.gst.toString();
//                             // salePriceController.text =
//                             //     selectedModel.ndp.toString();
//                             // amtController.text = selectedModel.ndp.toString();
//                             // quantityController.text =
//                             //     selectedModel.orderQty.toString();

//                             setState(() {});
//                           },
//                         ),
//                       ),
//                     ),
//                     addhorizontalSpace(10),
//                     SizedBox(
//                       width: 50,
//                       child: InkWell(
//                         onTap: () {
//                           // Get.to(AddCustomerflotScreen());
//                         },
//                         child: Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             border: Border.all(
//                               width: 2,
//                               color: Colors.black,
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 textfild("Work Disc.", workDiscController),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textfild("Hsn Code", hsnCodeController),
//                     ),
//                     addhorizontalSpace(10),
//                     Expanded(
//                       child: textfild("Quantity", quantityController),
//                     ),
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textfild("Amt", amtController),
//                     ),
//                     addhorizontalSpace(10),
//                     Expanded(
//                       child: textfild("Gst", gstController),
//                     ),
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textfild("Sale price", salePriceController),
//                     ),
//                     addhorizontalSpace(10),
//                     Button("txt"),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (key.currentState!.validate()) {
//                             addButtonPressed();
//                           }
//                         },
//                         child: Text('Save'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 ...containers,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   TextFormField textfild(String labelText, TextEditingController controller) {
//     return TextFormField(
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please enter is value add";
//         }
//       },
//       controller: controller,
//       textInputAction: TextInputAction.done,
//       onChanged: (value) {},
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(width: 2.0, color: Colors.black),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(width: 2.0, color: Colors.black),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(width: 2.0, color: Colors.red),
//         ),
//         counterText: "",
//         labelText: labelText,
//         contentPadding: EdgeInsets.all(5),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   void addButtonPressed() {
//     String workDisc = workDiscController.text;
//     String quantity = quantityController.text;
//     String gst = gstController.text;
//     String salePrice = salePriceController.text;
//     String amt = amtController.text;

//     setState(() {
//       containers.add(
//         Container(
//           height: 100,
//           width: double.infinity,
//           margin: EdgeInsets.all(4),
//           padding: EdgeInsets.all(4),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: [
//               BoxShadow(blurRadius: 2, color: Colors.grey),
//             ],
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text("Work Disc:   $workDisc"),
//                 Text('Amt $amt'),
//                 Text("Quantity:  $quantity"),
//                 Text("Gst:  $gst"),
//                 // Text("Sale price: $salePrice"),
//               ],
//             ),
//           ),
//         ),
//       );

//       workDiscController.clear();
//       hsnCodeController.clear();
//       quantityController.clear();
//       amtController.clear();
//       gstController.clear();
//       salePriceController.clear();
//     });
//   }

//   Future<void> purchaesspartDeta() async {
//     print(1);
//     try {
//       final response = await http.get(Uri.parse(
//           'http://lms.muepetro.com/api/UserController1/GetItem?ItemGroupId=9'));
//       print(2);
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         setState(() {
//           hsnModels =
//               (jsonData as List).map((data) => Item.fromJson(data)).toList();
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
