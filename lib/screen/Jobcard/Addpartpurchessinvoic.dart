// // ignore_for_file: unused_import

// import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
// import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/String.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class addpartsScreen extends StatefulWidget {
//   const addpartsScreen({Key? key}) : super(key: key);

//   @override
//   State<addpartsScreen> createState() => _addpartsScreenState();
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

// class _addpartsScreenState extends State<addpartsScreen> {
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
//   // void dispose() {
//   //   // Clean up the controllers
//   //   quantityController.dispose();
//   //   amtController.dispose();
//   //   gstController.dispose();
//   //   super.dispose();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: BackButton(color: AppColor.kBlack),
//           toolbarHeight: 30,
//           centerTitle: true,
//           title: Text("Add part "),
//           backgroundColor: AppColor.kappabrcolr),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
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
//                               child:
//                                   Text('${model.itemId} - ${model.itemName}'),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             singleoutlate1 = value.toString();
//                             Item selectedModel = hsnModels
//                                 .firstWhere((model) => model.itemName == value);
//                             workDiscController.text =
//                                 selectedModel.itemDes.toString();
//                             gstController.text = selectedModel.gst.toString();
//                             amtController.text = selectedModel.ndp.toString();
//                             quantityController.text =
//                                 selectedModel.orderQty.toString();

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
//                 textformfiles(
//                   workDiscController,
//                   hintText: "Work Disc.",
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textformfiles(
//                         keyboardType: TextInputType.number,
//                         quantityController,
//                         hintText: "Quantity",
//                       ),
//                     ),
//                     addhorizontalSpace(5),
//                     Expanded(
//                         child: textformfiles(
//                       amtController,
//                       hintText: 'Amount',
//                       keyboardType: TextInputType.number,
//                     ))
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textformfiles(
//                         keyboardType: TextInputType.number,
//                         gstController,
//                         hintText: "Gst",
//                       ),
//                     ),
//                     addhorizontalSpace(5),
//                     Expanded(
//                         child: textformfiles(
//                       igstcontroller,
//                       hintText: 'Igst',
//                       keyboardType: TextInputType.number,
//                     ))
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textformfiles(
//                         keyboardType: TextInputType.number,
//                         sgstcontroller,
//                         hintText: "Sgst",
//                       ),
//                     ),
//                     addhorizontalSpace(5),
//                     Expanded(
//                         child: textformfiles(
//                       cgstcontroller,
//                       hintText: 'Cgst',
//                     ))
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textformfiles(
//                         keyboardType: TextInputType.number,
//                         GrossAmt,
//                         hintText: "grossAmt",
//                       ),
//                     ),
//                     addhorizontalSpace(5),
//                     Expanded(
//                         child: textformfiles(
//                       netamtConrroller,
//                       hintText: 'Netamt',
//                       keyboardType: TextInputType.number,
//                     ))
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 InkWell(
//                     onTap: () {
//                       addButtonPressed();
//                     },
//                     child: Button("Save")),
//                 addVerticalSpace(10),
//                 // ...containers,
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: addedItemList.length,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var item = addedItemList[index];

//                     return InkWell(
//                       onTap: () {
//                         workDiscController.text = item["workDisc"];
//                       },
//                       child: Container(
//                         height: 100,
//                         width: double.infinity,
//                         margin: EdgeInsets.all(4),
//                         padding: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           boxShadow: [
//                             BoxShadow(blurRadius: 2, color: Colors.grey),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Work Disc:  ${item["workDisc"]}"),
//                                 addhorizontalSpace(22),
//                                 Text('Gross Amt ${item["netamt"]}'),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Quantity:  ${item["quantity"]}"),
//                                 addhorizontalSpace(30),
//                                 Text("Gst:  ${item["gst"]}"),
//                                 Text(
//                                   'Total Net Amt: ${item['netamtValue']}',
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//                 Text(
//                   "${total()}",
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
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
//       double grossAmt = double.parse(GrossAmt.text);
//       double gstPercentage = double.parse(gstController.text);
//       double gstAmount = (gstPercentage / 100) * grossAmt;

//       double cgstAmount = gstAmount / 2;
//       double sgstAmount = gstAmount / 2;

//       double netAmt = grossAmt + gstAmount;

//       netamtConrroller.text = netAmt.toStringAsFixed(2);

//       cgstcontroller.text = cgstAmount.toStringAsFixed(2);
//       sgstcontroller.text = sgstAmount.toStringAsFixed(2);
//       double remainingAmount = netAmt - grossAmt;
//       igstcontroller.text = remainingAmount.toStringAsFixed(2);
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
//     // String workDisc = workDiscController.text;
//     // String quantity = quantityController.text;
//     // String gst = gstController.text;
//     // // String amt = amtController.text;
//     String gross = GrossAmt.text.toString();

//     // double netamt = double.parse(gross);

//     addedItemList.add({
//       "workDisc": workDiscController.text,
//       "quantity": quantityController.text,
//       "gst": gstController.text,
//       "gross": GrossAmt.text.toString(),
//       "netamt": double.parse(gross),
//       "netamtValue": netamtConrroller.text
//     });
//     setState(() {});

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

// // ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';

// class addpartsScreen extends StatefulWidget {
//   const addpartsScreen({Key? key});

//   @override
//   State<addpartsScreen> createState() => _addpartsScreenState();
// }

// final key = GlobalKey<FormState>();
// var h, w;
// String customer = "Work No.";
// List<String> drop = [
//   'Work No.',
//   'black',
//   'red',
//   'green',
//   "ambar",
//   "gray",
//   "yellow"
// ];

// class _addpartsScreenState extends State<addpartsScreen> {
//   TextEditingController workDiscController = TextEditingController();
//   TextEditingController hsnCodeController = TextEditingController();
//   TextEditingController quantityController = TextEditingController();
//   TextEditingController amtController = TextEditingController();
//   TextEditingController gstController = TextEditingController();
//   TextEditingController salePriceController = TextEditingController();

//   List<Widget> containers = [];
//   var index = 0;
//   @override
//   void dispose() {
//     workDiscController.dispose();
//     quantityController.dispose();
//     amtController.dispose();
//     salePriceController.dispose();
//     super.dispose();
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
//           title: Text("Add Labour"),
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
//                         padding: const EdgeInsets.all(8),
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 2),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: DropdownButton(
//                           underline: Container(),
//                           value: customer,
//                           dropdownColor:
//                               const Color.fromARGB(255, 211, 247, 212),
//                           icon: Icon(
//                             Icons.keyboard_arrow_down_outlined,
//                             size: h * 0.030,
//                             color: Colors.black,
//                           ),
//                           isExpanded: true,
//                           items: drop.map((value) {
//                             return DropdownMenuItem(
//                               value: value,
//                               child: Text(
//                                 value,
//                               ),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               customer = value.toString();
//                             });
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
//                 textfild("Work Disc.", workDiscController, TextInputType.text),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textfild(
//                           "Hsn Code", hsnCodeController, TextInputType.number),
//                     ),
//                     addhorizontalSpace(10),
//                     Expanded(
//                       child: textfild(
//                           "Quantity", quantityController, TextInputType.text),
//                     ),
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child:
//                           textfild("Amt", amtController, TextInputType.number),
//                     ),
//                     addhorizontalSpace(10),
//                     Expanded(
//                       child:
//                           textfild("Gst", gstController, TextInputType.number),
//                     ),
//                   ],
//                 ),
//                 addVerticalSpace(10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: textfild("Sale price", salePriceController,
//                           TextInputType.text),
//                     ),
//                     addhorizontalSpace(10),
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

//   TextFormField textfild(String labelText, TextEditingController controller,
//       TextInputType? keyboardType) {
//     return TextFormField(
//       keyboardType: keyboardType,
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

//     setState(() {
//       index++;
//       containers.add(
//         Container(
//           height: 120,
//           width: double.infinity,
//           margin: EdgeInsets.all(5),
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(blurRadius: 2, color: Colors.grey),
//             ],
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                  Container(
//                   height: 15,
//                   width: 25,
//                   decoration: BoxDecoration(
//                     boxShadow: [BoxShadow(blurRadius: 2,color: AppColor.kGray)],
//                     border: Border.all(color: AppColor.kGray),
//                     borderRadius: BorderRadius.circular(2),
//                     color: AppColor.kWhite,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "#$index",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.kBlack),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "$customer",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 addhorizontalSpace(5),
//                 Text("$workDisc"),
//                 addhorizontalSpace(5),
//                 Text("$quantity"),
//                 addhorizontalSpace(5),
//                 Text("$gst"),
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
// }

// ignore_for_file: unused_import

import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class addpartsScreen extends StatefulWidget {
  const addpartsScreen({Key? key}) : super(key: key);

  @override
  State<addpartsScreen> createState() => _addpartsScreenState();
}

TextEditingController igstcontroller = TextEditingController();
TextEditingController namecontroller = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController amtController = TextEditingController();
TextEditingController gstController = TextEditingController();
TextEditingController salePriceController = TextEditingController();
TextEditingController sgstcontroller = TextEditingController();
TextEditingController cgstcontroller = TextEditingController();
TextEditingController netamtConrroller = TextEditingController();
TextEditingController GrossAmt = TextEditingController();
TextEditingController workDiscController = TextEditingController();

class _addpartsScreenState extends State<addpartsScreen> {
  @override
  void initState() {
    super.initState();
    purchaesspartDeta();
    quantityController.addListener(_updateGrossAmt);
    amtController.addListener(_updateGrossAmt);
    gstController.addListener(_updateNetAmt);
  }

  List<Item> hsnModels = [];
  String singleoutlate1 = "Single Outlet";
  List<Widget> containers = [];
  List addedItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: AppColor.kBlack),
          toolbarHeight: 30,
          centerTitle: true,
          title: Text("Add part "),
          backgroundColor: AppColor.kappabrcolr),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonFormField(
                          value: hsnModels.first.itemName.toString(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: AppColor.kGray),
                            ),
                            hintText: 'Select Hsn Code',
                            contentPadding: EdgeInsets.all(5),
                          ),
                          dropdownColor:
                              const Color.fromARGB(255, 211, 247, 212),
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 24,
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          items: hsnModels.map((model) {
                            return DropdownMenuItem(
                              value: model.itemName.toString(),
                              child:
                                  Text('${model.itemId} - ${model.itemName}'),
                            );
                          }).toList(),
                          onChanged: (value) {
                            singleoutlate1 = value.toString();
                            Item selectedModel = hsnModels
                                .firstWhere((model) => model.itemName == value);
                            workDiscController.text =
                                selectedModel.itemDes.toString();
                            gstController.text = selectedModel.gst.toString();
                            amtController.text = selectedModel.ndp.toString();
                            quantityController.text =
                                selectedModel.orderQty.toString();

                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    addhorizontalSpace(10),
                    SizedBox(
                      width: 50,
                      child: InkWell(
                        onTap: () {
                          // Get.to(AddCustomerflotScreen());
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                addVerticalSpace(10),
                textformfiles(
                  workDiscController,
                  hintText: "Work Disc.",
                  labelText: "Work Disc.",
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textformfiles(
                        keyboardType: TextInputType.number,
                        quantityController,
                        hintText: "Quantity",
                        labelText: "Quantity",
                      ),
                    ),
                    addhorizontalSpace(5),
                    Expanded(
                        child: textformfiles(
                      amtController,
                      hintText: 'Amount',
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textformfiles(
                        keyboardType: TextInputType.number,
                        gstController,
                        hintText: "Gst",
                      ),
                    ),
                    addhorizontalSpace(5),
                    Expanded(
                        child: textformfiles(
                      igstcontroller,
                      hintText: 'Igst',
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textformfiles(
                        keyboardType: TextInputType.number,
                        sgstcontroller,
                        hintText: "Sgst",
                        labelText:   "Sgst",
                      ),
                    ),
                    addhorizontalSpace(5),
                    Expanded(
                        child: textformfiles(
                      cgstcontroller,
                      hintText: 'Cgst',
                      labelText: 'Cgst',
                    ))
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textformfiles(
                        keyboardType: TextInputType.number,
                        GrossAmt,
                        hintText: "grossAmt",
                        labelText:  "grossAmt",
                      ),
                    ),
                    addhorizontalSpace(5),
                    Expanded(
                        child: textformfiles(
                      netamtConrroller,
                      hintText: 'Netamt',
                      labelText: 'Netamt',
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                addVerticalSpace(10),
                InkWell(
                    onTap: () {
                      addButtonPressed();
                    },
                    child: Button("Save")),
                addVerticalSpace(10),
                // ...containers,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: addedItemList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = addedItemList[index];

                    return InkWell(
                      onTap: () {
                        workDiscController.text = item["workDisc"];
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.grey),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Work Disc:  ${item["workDisc"]}"),
                                addhorizontalSpace(22),
                                Text('Gross Amt ${item["netamt"]}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Quantity:  ${item["quantity"]}"),
                                addhorizontalSpace(30),
                                Text("Gst:  ${item["gst"]}"),
                                Text(
                                  'Total Net Amt: ${item['netamtValue']}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                Text(
                  "${total()}",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateGrossAmt() {
    try {
      double quantity = double.parse(quantityController.text);
      double amt = double.parse(amtController.text);
      double grossAmt = quantity * amt;
      GrossAmt.text = grossAmt.toStringAsFixed(2);
      _updateNetAmt();
    } catch (e) {
      print('Error calculating gross amount: $e');
    }
  }

  void _updateNetAmt() {
    try {
      double mrp = double.parse(GrossAmt.text);
      double gstPercentage = double.parse(gstController.text);

      // Calculate GST amount included in MRP
      double gstAmountIncludedInMrp =
          (gstPercentage / (100 + gstPercentage)) * mrp;

      // Calculate Gross Amount excluding GST
      double grossAmtExcludingGst = mrp - gstAmountIncludedInMrp;

      double cgstAmount = gstAmountIncludedInMrp / 2;
      double sgstAmount = gstAmountIncludedInMrp / 2;

      // Calculate Net Amount excluding GST
      double netAmtExcludingGst = grossAmtExcludingGst;

      netamtConrroller.text = netAmtExcludingGst.toStringAsFixed(2);

      cgstcontroller.text = cgstAmount.toStringAsFixed(2);
      sgstcontroller.text = sgstAmount.toStringAsFixed(2);

      // Calculate IGST as the remaining amount after subtracting GST from Gross Amount
      double igstAmount = mrp - grossAmtExcludingGst;
      igstcontroller.text = igstAmount.toStringAsFixed(2);

      setState(() {});
    } catch (e) {
      print('Error calculating net amount: $e');
    }
  }

  // void _updateNetAmt() {
  //   try {
  //     double grossAmt = double.parse(GrossAmt.text);
  //     double gstPercentage = double.parse(gstController.text);
  //     double gstAmount = (gstPercentage / 100) * grossAmt;

  //     double cgstAmount = gstAmount / 2;
  //     double sgstAmount = gstAmount / 2;

  //     double netAmt = grossAmt + gstAmount;

  //     netamtConrroller.text = netAmt.toStringAsFixed(2);

  //     cgstcontroller.text = cgstAmount.toStringAsFixed(2);
  //     sgstcontroller.text = sgstAmount.toStringAsFixed(2);
  //     double remainingAmount = netAmt - grossAmt;
  //     igstcontroller.text = remainingAmount.toStringAsFixed(2);
  //     setState(() {});
  //   } catch (e) {
  //     print('Error calculating net amount: $e');
  //   }
  // }

  Future<void> purchaesspartDeta() async {
    print(1);
    try {
      final response = await http.get(Uri.parse(
          'http://lms.muepetro.com/api/UserController1/GetItem?ItemGroupId=9'));
      print(2);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          hsnModels =
              (jsonData as List).map((data) => Item.fromJson(data)).toList();
          print(3);
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
      print(4);
    } catch (e) {
      print('Error: $e');
    }
  }

  void addButtonPressed() {
    // String workDisc = workDiscController.text;
    // String quantity = quantityController.text;
    // String gst = gstController.text;
    // // String amt = amtController.text;
    String gross = GrossAmt.text.toString();

    // double netamt = double.parse(gross);

    addedItemList.add({
      "workDisc": workDiscController.text,
      "quantity": quantityController.text,
      "gst": gstController.text,
      "gross": GrossAmt.text.toString(),
      "netamt": double.parse(gross),
      "netamtValue": netamtConrroller.text
    });
    setState(() {});

    setState(() {});
    clearControllers();
  }

  total() {
    double amount = 0;
    for (var i = 0; i < addedItemList.length; i++) {
      amount += double.parse(addedItemList[i]['netamtValue'].toString());
    }
    return amount;
  }

  void clearControllers() {
    workDiscController.clear();
    quantityController.clear();
    amtController.clear();
    gstController.clear();
    salePriceController.clear();
    gstController.clear();
    netamtConrroller.clear();
    GrossAmt.clear();
    igstcontroller.clear();
    sgstcontroller.clear();
    cgstcontroller.clear();
  }
}
