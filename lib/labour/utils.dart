// // ignore_for_file: unused_import

// import 'package:autowheelapp/account/InvoiceScreen.dart';
// import 'package:autowheelapp/utils/widget/learnng.dart';
// import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
// import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/String.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class JobcardLabourscreen extends StatefulWidget {
//   const JobcardLabourscreen({Key? key}) : super(key: key);

//   @override
//   State<JobcardLabourscreen> createState() => _JobcardLabourscreenState();
// }

// TextEditingController igstcontroller = TextEditingController();
// TextEditingController namecontroller = TextEditingController();
// TextEditingController quantityController = TextEditingController();
// TextEditingController amtController = TextEditingController();
// TextEditingController gstController = TextEditingController();
// TextEditingController salePriceController = TextEditingController();
// TextEditingController sgstcontroller = TextEditingController();
// TextEditingController cgstcontroller = TextEditingController();
// TextEditingController netamtConrroller = TextEditingController();
// TextEditingController GrossAmt = TextEditingController();
// TextEditingController workDiscController = TextEditingController();

// class _JobcardLabourscreenState extends State<JobcardLabourscreen> {
//   final InvoiceController invoiceController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     purchaesspartDeta();
//     quantityController.addListener(_updateGrossAmt);
//     amtController.addListener(_updateGrossAmt);
//     gstController.addListener(_updateNetAmt);

//   }

//   List<Item> hsnModels = [];
//   String singleoutlate1 = "Single Outlet";
//   List<Widget> containers = [];
//   List addedItemList = [];
//   List addedItemListLabour = [];

//   double _grossAmountDouble = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: BackButton(color: AppColor.kBlack),
//           toolbarHeight: 30,
//           centerTitle: true,
//           title: Text("Add labour "),
//           // actions: [
//           //   ElevatedButton(
//           //       onPressed: () {
//           //         Navigator.pushReplacement(
//           //             context,
//           //             MaterialPageRoute(
//           //                 builder: (context) => InvoiveScreen(
//           //                       spareamount: totallabouramt(),
//           //                       Labouramount: totalgstamt(),
//           //                       // totlanet: total(),
//           //                       totalgross:totalgrossamt(),
//           //                     )));
//           //       },
//           //       child: Text("All Data"))
//           // ],
//           backgroundColor: AppColor.kappabrcolr),
//       body: hsnModels.isEmpty
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               height: 50,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: Colors.black, width: 1),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: DropdownButtonFormField(
//                                 value: hsnModels.first.itemName.toString(),
//                                 decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         width: 1, color: AppColor.kGray),
//                                   ),
//                                   hintText: 'Select Hsn Code',
//                                   contentPadding: EdgeInsets.all(5),
//                                 ),
//                                 dropdownColor:
//                                     const Color.fromARGB(255, 211, 247, 212),
//                                 icon: Icon(
//                                   Icons.keyboard_arrow_down_outlined,
//                                   size: 24,
//                                   color: Colors.black,
//                                 ),
//                                 isExpanded: true,
//                                 items: hsnModels.map((model) {
//                                   return DropdownMenuItem(
//                                     value: model.itemName.toString(),
//                                     child: Text(
//                                         '${model.itemId} - ${model.itemName}'),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   singleoutlate1 = value.toString();
//                                   Item selectedModel = hsnModels.firstWhere(
//                                       (model) => model.itemName == value);
//                                   workDiscController.text =
//                                       selectedModel.itemDes.toString();
//                                   gstController.text =
//                                       selectedModel.gst.toString();
//                                   amtController.text =
//                                       selectedModel.ndp.toString();
//                                   quantityController.text =
//                                       selectedModel.orderQty.toString();

//                                   setState(() {
//                                     _grossAmountDouble =
//                                         double.parse(GrossAmt.text);
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           addhorizontalSpace(10),
//                           SizedBox(
//                             width: 50,
//                             child: InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                     width: 2,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 child: Icon(
//                                   Icons.add,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       textformfiles(
//                         workDiscController,
//                         hintText: "Work Disc.",
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               quantityController,
//                               hintText: "Quantity",
//                               labelText: "Quantity",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             amtController,
//                             hintText: 'Amount',
//                             labelText: 'Amount',
//                             keyboardType: TextInputType.number,
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               gstController,
//                               hintText: "Gst",
//                               labelText: "Gst",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             igstcontroller,
//                             hintText: 'Igst',
//                             labelText: 'Igst',
//                             keyboardType: TextInputType.number,
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               sgstcontroller,
//                               hintText: "Sgst",
//                               labelText: "Sgst",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             cgstcontroller,
//                             hintText: 'Cgst',
//                             labelText: 'Cgst',
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               GrossAmt,
//                               hintText: "grossAmt",
//                               labelText: "grossAmt",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             netamtConrroller,
//                             hintText: 'Netamt',
//                             labelText: 'Netamt',
//                             keyboardType: TextInputType.number,
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       InkWell(
//                           onTap: () {
//                             // addButtonPressed();
//                             // double laborPrice = _grossAmountDouble;
//                             // double gst = 0.05;
//                             // invoiceController.addLabor(laborPrice, gst);
//                             // Get.back();
//                           },
//                           child: Button("Save")),
//                       addVerticalSpace(10),
//                       InkWell(
//                           onTap: () {
//                             addButtonPressed();
//                             double laborPrice = _grossAmountDouble;
//                             double gst = 0.05;
//                             invoiceController.addLabor(laborPrice, gst);
//                             // Get.back();
//                           },
//                           child: Button("Details")),
//                       addVerticalSpace(10),
//                       // ...containers,
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: addedItemList.length,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           var item = addedItemList[index];

//                           return InkWell(
//                             onTap: () {
//                               workDiscController.text = item["workDisc"];
//                             },
//                             child: Container(
//                               height: 100,
//                               width: double.infinity,
//                               margin: EdgeInsets.all(4),
//                               padding: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(5),
//                                 boxShadow: [
//                                   BoxShadow(blurRadius: 2, color: Colors.grey),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Work Disc:  ${item["workDisc"]}"),
//                                       addhorizontalSpace(22),
//                                       Text('Gross Amt ${item["netamt"]}'),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Quantity:  ${item["quantity"]}"),
//                                       addhorizontalSpace(30),
//                                       Text("Gst:  ${item["gst"]}"),
//                                       Text(
//                                         'Total Net Amt: ${item['netamtValue']}',
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),

//                       Text(
//                         "Net amount : ${total()}",
//                         style: TextStyle(fontSize: 24),
//                       ),
//                       // Text(
//                       //   "Net amount : ${totallabouramt()}",
//                       //   style: TextStyle(fontSize: 24),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   void _updateGrossAmt() {
//     try {
//       double quantity = double.parse(quantityController.text);
//       double amt = double.parse(amtController.text);
//       double grossAmt = quantity * amt;
//       GrossAmt.text = grossAmt.toStringAsFixed(2);
//       _updateNetAmt();
//     } catch (e) {
//       print('Error calculating gross amount: $e');
//     }
//   }

//   void _updateNetAmt() {
//     try {
//       double mrp = double.parse(GrossAmt.text);
//       double gstPercentage = double.parse(gstController.text);

//       // Calculate GST amount included in MRP
//       double gstAmountIncludedInMrp =
//           (gstPercentage / (100 + gstPercentage)) * mrp;

//       // Calculate Gross Amount excluding GST
//       double grossAmtExcludingGst = mrp - gstAmountIncludedInMrp;

//       double cgstAmount = gstAmountIncludedInMrp / 2;
//       double sgstAmount = gstAmountIncludedInMrp / 2;

//       // Calculate Net Amount excluding GST
//       double netAmtExcludingGst = grossAmtExcludingGst;

//       netamtConrroller.text = netAmtExcludingGst.toStringAsFixed(2);

//       cgstcontroller.text = cgstAmount.toStringAsFixed(2);
//       sgstcontroller.text = sgstAmount.toStringAsFixed(2);

//       // Calculate IGST as the remaining amount after subtracting GST from Gross Amount
//       double igstAmount = mrp - grossAmtExcludingGst;
//       igstcontroller.text = igstAmount.toStringAsFixed(2);

//       setState(() {});
//     } catch (e) {
//       print('Error calculating net amount: $e');
//     }
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

//   void addButtonPressed() {

//     String gross = GrossAmt.text.toString();
//     addedItemList.add({
//       "workDisc": workDiscController.text,
//       "quantity": quantityController.text,
//       "gst": gstController.text,
//       "Igst": igstcontroller.text,
//       "gross": GrossAmt.text.toString(),
//       "netamt": double.parse(gross),
//       "netamtValue": netamtConrroller.text
//     });

//     setState(() {});
//     clearControllers();
//   }

  
//   total() {
//     double amount = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount += double.parse(addedItemList[i]['netamtValue'].toString());
//     }
//     return amount;
//   }

//   totallabouramt() {
//     double amount1 = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount1 += double.parse(addedItemList[i]['netamtValue'].toString());
//     }
//     return amount1;
//   }

//   totalgstamt() {
//     double amount2 = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount2 += double.parse(addedItemList[i]['Igst'].toString());
//     }
//     return amount2;
//   }

//   totalgrossamt() {
//     double amount3 = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount3 += double.parse(addedItemList[i]['gross'].toString());
//     }
//     return amount3;
//   }

//   void clearControllers() {
//     workDiscController.clear();
//     quantityController.clear();
//     amtController.clear();
//     gstController.clear();
//     salePriceController.clear();
//     gstController.clear();
//     netamtConrroller.clear();
//     GrossAmt.clear();
//     igstcontroller.clear();
//     sgstcontroller.clear();
//     cgstcontroller.clear();
//   }
// }
//












import 'package:autowheelapp/account/InvoiceScreen.dart';
// import 'package:autowheelapp/utils/widget/learnng.dart';
// import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
// import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/String.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class JobcardLabourscreen extends StatefulWidget {
//   const JobcardLabourscreen({Key? key}) : super(key: key);

//   @override
//   State<JobcardLabourscreen> createState() => _JobcardLabourscreenState();
// }

// TextEditingController igstcontroller = TextEditingController();
// TextEditingController namecontroller = TextEditingController();
// TextEditingController quantityController = TextEditingController();
// TextEditingController amtController = TextEditingController();
// TextEditingController gstController = TextEditingController();
// TextEditingController salePriceController = TextEditingController();
// TextEditingController sgstcontroller = TextEditingController();
// TextEditingController cgstcontroller = TextEditingController();
// TextEditingController netamtConrroller = TextEditingController();
// TextEditingController GrossAmt = TextEditingController();
// TextEditingController workDiscController = TextEditingController();

// class _JobcardLabourscreenState extends State<JobcardLabourscreen> {
//   final InvoiceController invoiceController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     purchaesspartDeta();
//     quantityController.addListener(_updateGrossAmt);
//     amtController.addListener(_updateGrossAmt);
//     gstController.addListener(_updateNetAmt);
//   }

//   List<Item> hsnModels = [];
//   String singleoutlate1 = "Single Outlet";
//   List<Widget> containers = [];
//   List addedItemList = [];
//   List addedItemListLabour = [];
//   double _grossAmountDouble = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: BackButton(color: AppColor.kBlack),
//           toolbarHeight: 30,
//           centerTitle: true,
//           title: Text("Add labour "),
//           // actions: [
//           //   ElevatedButton(
//           //       onPressed: () {
//           //         Navigator.pushReplacement(
//           //             context,
//           //             MaterialPageRoute(
//           //                 builder: (context) => InvoiveScreen(
//           //                       spareamount: totallabouramt(),
//           //                       Labouramount: totalgstamt(),
//           //                       // totlanet: total(),
//           //                       totalgross:totalgrossamt(),
//           //                     )));
//           //       },
//           //       child: Text("All Data"))
//           // ],
//           backgroundColor: AppColor.kappabrcolr),
//       body: hsnModels.isEmpty
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               height: 50,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: Colors.black, width: 1),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: DropdownButtonFormField(
//                                 value: hsnModels.first.itemName.toString(),
//                                 decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         width: 1, color: AppColor.kGray),
//                                   ),
//                                   hintText: 'Select Hsn Code',
//                                   contentPadding: EdgeInsets.all(5),
//                                 ),
//                                 dropdownColor:
//                                     const Color.fromARGB(255, 211, 247, 212),
//                                 icon: Icon(
//                                   Icons.keyboard_arrow_down_outlined,
//                                   size: 24,
//                                   color: Colors.black,
//                                 ),
//                                 isExpanded: true,
//                                 items: hsnModels.map((model) {
//                                   return DropdownMenuItem(
//                                     value: model.itemName.toString(),
//                                     child: Text(
//                                         '${model.itemId} - ${model.itemName}'),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   singleoutlate1 = value.toString();
//                                   Item selectedModel = hsnModels.firstWhere(
//                                       (model) => model.itemName == value);
//                                   workDiscController.text =
//                                       selectedModel.itemDes.toString();
//                                   gstController.text =
//                                       selectedModel.gst.toString();
//                                   amtController.text =
//                                       selectedModel.ndp.toString();
//                                   quantityController.text =
//                                       selectedModel.orderQty.toString();

//                                   setState(() {
//                                     _grossAmountDouble =
//                                         double.parse(GrossAmt.text);
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           addhorizontalSpace(10),
//                           SizedBox(
//                             width: 50,
//                             child: InkWell(
//                               onTap: () {},
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                     width: 2,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 child: Icon(
//                                   Icons.add,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       textformfiles(
//                         workDiscController,
//                         hintText: "Work Disc.",
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               quantityController,
//                               hintText: "Quantity",
//                               labelText: "Quantity",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             amtController,
//                             hintText: 'Amount',
//                             labelText: 'Amount',
//                             keyboardType: TextInputType.number,
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               gstController,
//                               hintText: "Gst",
//                               labelText: "Gst",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             igstcontroller,
//                             hintText: 'Igst',
//                             labelText: 'Igst',
//                             keyboardType: TextInputType.number,
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               sgstcontroller,
//                               hintText: "Sgst",
//                               labelText: "Sgst",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             cgstcontroller,
//                             hintText: 'Cgst',
//                             labelText: 'Cgst',
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: textformfiles(
//                               keyboardType: TextInputType.number,
//                               GrossAmt,
//                               hintText: "grossAmt",
//                               labelText: "grossAmt",
//                             ),
//                           ),
//                           addhorizontalSpace(5),
//                           Expanded(
//                               child: textformfiles(
//                             netamtConrroller,
//                             hintText: 'Netamt',
//                             labelText: 'Netamt',
//                             keyboardType: TextInputType.number,
//                           ))
//                         ],
//                       ),
//                       addVerticalSpace(10),
//                       InkWell(
//                           onTap: () {
//                             addButtonPressed();
//                             double laborPrice = _grossAmountDouble;
//                             double gst = 0.05;
//                             invoiceController.addLabor(laborPrice, gst);
//                           },
//                           child: Button("Details")),
//                       addVerticalSpace(10),
//                       InkWell(
//                           onTap: () {
//                             addButtonPressed();
//                             double laborPrice = _grossAmountDouble;
//                             double gst = 0.05;
//                             invoiceController.addLabor(laborPrice, gst);
//                             Get.back();
//                           },
//                           child: Button("Save")),
//                       addVerticalSpace(10),
//                       // ...containers,
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: addedItemList.length,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           var item = addedItemList[index];

//                           return InkWell(
//                             onTap: () {
//                               workDiscController.text = item["workDisc"];
//                             },
//                             child: Container(
//                               height: 100,
//                               width: double.infinity,
//                               margin: EdgeInsets.all(4),
//                               padding: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(5),
//                                 boxShadow: [
//                                   BoxShadow(blurRadius: 2, color: Colors.grey),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Work Disc:  ${item["workDisc"]}"),
//                                       addhorizontalSpace(22),
//                                       Text('Gross Amt ${item["netamt"]}'),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Quantity:  ${item["quantity"]}"),
//                                       addhorizontalSpace(30),
//                                       Text("Gst:  ${item["gst"]}"),
//                                       Text(
//                                         'Total Net Amt: ${item['netamtValue']}',
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),

//                       Text(
//                         "Net amount : ${total()}",
//                         style: TextStyle(fontSize: 24),
//                       ),
//                       // Text(
//                       //   "Net amount : ${totallabouramt()}",
//                       //   style: TextStyle(fontSize: 24),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   void _updateGrossAmt() {
//     try {
//       double quantity = double.parse(quantityController.text);
//       double amt = double.parse(amtController.text);
//       double grossAmt = quantity * amt;
//       GrossAmt.text = grossAmt.toStringAsFixed(2);
//       _updateNetAmt();
//     } catch (e) {
//       print('Error calculating gross amount: $e');
//     }
//   }

//   void _updateNetAmt() {
//     try {
//       double mrp = double.parse(GrossAmt.text);
//       double gstPercentage = double.parse(gstController.text);

//       // Calculate GST amount included in MRP
//       double gstAmountIncludedInMrp =
//           (gstPercentage / (100 + gstPercentage)) * mrp;

//       // Calculate Gross Amount excluding GST
//       double grossAmtExcludingGst = mrp - gstAmountIncludedInMrp;

//       double cgstAmount = gstAmountIncludedInMrp / 2;
//       double sgstAmount = gstAmountIncludedInMrp / 2;

//       // Calculate Net Amount excluding GST
//       double netAmtExcludingGst = grossAmtExcludingGst;

//       netamtConrroller.text = netAmtExcludingGst.toStringAsFixed(2);

//       cgstcontroller.text = cgstAmount.toStringAsFixed(2);
//       sgstcontroller.text = sgstAmount.toStringAsFixed(2);

//       // Calculate IGST as the remaining amount after subtracting GST from Gross Amount
//       double igstAmount = mrp - grossAmtExcludingGst;
//       igstcontroller.text = igstAmount.toStringAsFixed(2);

//       setState(() {});
//     } catch (e) {
//       print('Error calculating net amount: $e');
//     }
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

//   void addButtonPressed() {
//     String gross = GrossAmt.text.toString();
//     addedItemList.add({
//       "workDisc": workDiscController.text,
//       "quantity": quantityController.text,
//       "gst": gstController.text,
//       "Igst": igstcontroller.text,
//       "gross": GrossAmt.text.toString(),
//       "netamt": double.parse(gross),
//       "netamtValue": netamtConrroller.text
//     });

//     setState(() {});
//     clearControllers();
//   }

//   total() {
//     double amount = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount += double.parse(addedItemList[i]['netamtValue'].toString());
//     }
//     return amount;
//   }

//   totallabouramt() {
//     double amount1 = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount1 += double.parse(addedItemList[i]['netamtValue'].toString());
//     }
//     return amount1;
//   }

//   totalgstamt() {
//     double amount2 = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount2 += double.parse(addedItemList[i]['Igst'].toString());
//     }
//     return amount2;
//   }

//   totalgrossamt() {
//     double amount3 = 0;
//     for (var i = 0; i < addedItemList.length; i++) {
//       amount3 += double.parse(addedItemList[i]['gross'].toString());
//     }
//     return amount3;
//   }

//   void clearControllers() {
//     workDiscController.clear();
//     quantityController.clear();
//     amtController.clear();
//     gstController.clear();
//     salePriceController.clear();
//     gstController.clear();
//     netamtConrroller.clear();
//     GrossAmt.clear();
//     igstcontroller.clear();
//     sgstcontroller.clear();
//     cgstcontroller.clear();
//   }
// }
