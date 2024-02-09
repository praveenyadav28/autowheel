import 'dart:convert';
import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/models/hsnmodel.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/screen/master/HsnCategary.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class PartsMasters extends StatefulWidget {
  const PartsMasters({Key? key}) : super(key: key);

  @override
  State<PartsMasters> createState() => _PartsMastersState();
}

class _PartsMastersState extends State<PartsMasters> {
  double h = 0.0;
  double w = 0.0;

  /// group
  String selectedGroupName = "Select Group";
  Map<String, dynamic>? selectedgroupValue;
  int groupid = 0;
  final TextEditingController gropuController = TextEditingController();
  // int? selectedGroupId;
  List<Map<String, dynamic>> drop = [
    {'id': 0, 'name': 'Select Group'}
  ];
  // group

  Map<String, dynamic>? singleoutlate1;
  // var manufactureValue;
  List<Map<String, dynamic>> hsnModels = [];
  Map<String, dynamic>? singleoutlatevalue;
  int hsnId = 0;
  final TextEditingController hsnController = TextEditingController();

  Map<String, dynamic>? selectedManufacturer;
  List<Map<String, dynamic>> manufacturers = [];
  Map<String, dynamic>? selectedManufacturerValue;
  int Manufacturerid = 0;
  final TextEditingController ManufacturerController = TextEditingController();

  double igstValue = 0.0;
  double cgstValue = 0.0;
  double sgstValue = 0.0;

  TextEditingController PartNoumbarController = TextEditingController();
  TextEditingController partnamecontroller = TextEditingController();
  TextEditingController IgstController = TextEditingController();
  TextEditingController CgstController = TextEditingController();
  TextEditingController SgstController = TextEditingController();
  TextEditingController NdpController = TextEditingController();
  TextEditingController MrpController = TextEditingController();
  TextEditingController BillNoController = TextEditingController();
  TextEditingController OpeningController = TextEditingController();
  TextEditingController ColoseController = TextEditingController();
  TextEditingController marginController = TextEditingController();
  TextEditingController AmountController = TextEditingController();
  var isshowdata = false;
  bool isrefresh = false;

  @override
  void initState() {
    super.initState();
    groupData();
    manufutureurData();
    HsnIdScreenapi();
  }

  refreshData() async {
    await groupData();
    manufutureurData();
    HsnIdScreenapi();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height.toDouble();
    w = MediaQuery.of(context).size.width.toDouble();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,
        title: Text(
          "Part Masters",
          style: TextStyle(color: AppColor.kBlack),
        ),
      ),
      body: hsnModels.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      addVerticalSpace(10),
                      textformfiles(
                        PartNoumbarController,
                        labelText: "Part No.*",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please Enter Part No..";
                          }
                        },
                      ),
                      addVerticalSpace(10),
                      textformfiles(
                        partnamecontroller,
                        labelText: "Part Name.*",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please Enter Part Name.";
                          }
                        },
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<Map<String, dynamic>>(
                                  isExpanded: true,
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.kBlack,
                                    ),
                                  ),
                                  hint: Text(
                                    'Select Group',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items: drop
                                      .map((item) => DropdownMenuItem(
                                            onTap: () {
                                              groupid = item['id'];
                                            },
                                            value: item,
                                            child: Row(
                                              children: [
                                                Text(
                                                  item['name'].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedgroupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedgroupValue = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 20,
                                    width: 200,
                                  ),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 200,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController: gropuController,
                                    searchInnerWidgetHeight: 50,
                                    searchInnerWidget: Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        expands: true,
                                        readOnly: false,
                                        maxLines: null,
                                        controller: gropuController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Filter the Prionaity list based on the search value
                                            drop
                                                .where((item) => item['name']
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase()))
                                                .toList();
                                          });
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          hintText:
                                              'Search for a Manufacture...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      gropuController.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          addhorizontalSpace(10),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () async {
                                String refreshResult = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Group1Screen(
                                              SourecID: modal().group,
                                            ))).then((value) => refreshData());

                                if (refreshResult == "refresh") {
                                  setState(() {
                                    isrefresh = true;
                                    // Refresh your page here
                                  });
                                }
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
                                    color: AppColor.kBlack,
                                  )),
                            ),
                          )
                        ],
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<Map<String, dynamic>>(
                                  isExpanded: true,
                                  underline: Container(),
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.kBlack,
                                    ),
                                  ),
                                  hint: Text(
                                    'Select manufacturers',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items: manufacturers
                                      .map((item) => DropdownMenuItem(
                                            onTap: () {
                                              Manufacturerid = item['id'];
                                            },
                                            value: item,
                                            child: Text(
                                              item['ledger_Name'].toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedManufacturerValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedManufacturerValue = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 20,
                                    width: 200,
                                  ),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 200,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController: ManufacturerController,
                                    searchInnerWidgetHeight: 50,
                                    searchInnerWidget: Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        expands: true,
                                        readOnly: false,
                                        maxLines: null,
                                        controller: ManufacturerController,
                                        onChanged: (value) {
                                          setState(() {
                                            manufacturers
                                                .where((item) =>
                                                    item['ledger_Name']
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(value
                                                            .toLowerCase()))
                                                .toList();
                                          });
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          hintText:
                                              'Search for a Manufacturer...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      ManufacturerController.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          addhorizontalSpace(10),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => LedgerScreen()))
                                    .then((value) => refreshData());
                                // Get.to(LedgerScreen());
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
                                  color: AppColor.kBlack,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: dropdownTextfield(
                              "Select HSN",
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<Map<String, dynamic>>(
                                  isExpanded: true,
                                  underline: Container(),
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.kBlack,
                                    ),
                                  ),
                                  hint: Text(
                                    'Select HSN',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items: hsnModels
                                      .map((item) => DropdownMenuItem(
                                            onTap: () {
                                              hsnId = item['hsn_Id'];
                                            },
                                            value: item,
                                            child: Text(
                                              item['hsn_Code'].toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                      .toList(),
                                  value: singleoutlatevalue,
                                  onChanged: (value) {
                                    setState(() {
                                      singleoutlatevalue = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 20,
                                    width: 200,
                                  ),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 200,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController: hsnController,
                                    searchInnerWidgetHeight: 50,
                                    searchInnerWidget: Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        expands: true,
                                        readOnly: false,
                                        maxLines: null,
                                        controller: hsnController,
                                        onChanged: (value) {
                                          setState(() {
                                            hsnModels
                                                .where((item) =>
                                                    item['ledger_Name']
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(value
                                                            .toLowerCase()))
                                                .toList();
                                  //                   IgstController.text =
                                  //     selectedModel.igst.toString();
                                  // CgstController.text =
                                  //     selectedModel.cgst.toString();
                                  // SgstController.text =
                                  //     selectedModel.sgst.toString();

                                          });
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          hintText: 'Search for a HSN...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      hsnController.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),

                          // Expanded(
                          //   child: dropdownTextfield(
                          //     "Select HSN",
                          //     DropdownButtonFormField(
                          //       decoration: InputDecoration(
                          //         border: UnderlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 color: Colors.transparent)),
                          //         focusedBorder: UnderlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 color: Colors.transparent)),
                          //         enabledBorder: UnderlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 color: Colors.transparent)),
                          //         errorBorder: UnderlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 color: Colors.transparent)),
                          //       ),
                          //       value: hsnModels.isNotEmpty
                          //           ? hsnModels.first.hsnCode
                          //           : null,
                          //       dropdownColor:
                          //           const Color.fromARGB(255, 211, 247, 212),
                          //       icon: Icon(
                          //         Icons.keyboard_arrow_down_outlined,
                          //         size: h * 0.030,
                          //         color: Colors.black,
                          //       ),
                          //       isExpanded: true,
                          //       items: hsnModels.map((model) {
                          //         return DropdownMenuItem(
                          //           value: model.hsnCode,
                          //           child: Text(model.hsnCode),
                          //         );
                          //       }).toList(),
                          //       onChanged: (value) {
                          //         singleoutlate1 = value.toString();
                          //         Websitmodal selectedModel =
                          //             hsnModels.firstWhere(
                          //                 (model) => model.hsnCode == value);
                          //         HSN_ID = selectedModel.hsnId;
                          //         print('Selected HSN ID: $HSN_ID');
                                  // IgstController.text =
                                  //     selectedModel.igst.toString();
                                  // CgstController.text =
                                  //     selectedModel.cgst.toString();
                                  // SgstController.text =
                                  //     selectedModel.sgst.toString();

                          //         setState(() {});
                          //       },
                          //     ),
                          //   ),
                          // ),

                          addhorizontalSpace(10),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => HsnCategary());
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
                                    color: AppColor.kBlack,
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textformfiles(IgstController,
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      hintText: "0.00",
                                      labelText: igsttext),
                                ],
                              ),
                            ),
                            addhorizontalSpace(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textformfiles(CgstController,
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      hintText: "0.00",
                                      labelText: cgsttxt)
                                ],
                              ),
                            ),
                            addhorizontalSpace(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textformfiles(SgstController,
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      hintText: "0.00",
                                      labelText: sgstxt)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(10),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textformfiles(
                                    NdpController,
                                    labelText: "NDP",
                                    keyboardType: TextInputType.number,
                                    hintText: "0.00",
                                  )
                                ],
                              ),
                            ),
                            addhorizontalSpace(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textformfiles(
                                    MrpController,
                                    hintText: "0.00",
                                    labelText: "MRP",
                                    keyboardType: TextInputType.number,
                                  )
                                ],
                              ),
                            ),
                            addhorizontalSpace(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textformfiles(
                                    BillNoController,
                                    hintText: "0.00",
                                    labelText: "Bin No.",
                                    keyboardType: TextInputType.number,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                              child: textformfiles(marginController,
                                  hintText: "Margin",
                                  labelText: "Margin",
                                  keyboardType: TextInputType.number)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: textformfiles(AmountController,
                                  hintText: "Amount",
                                  labelText: "Amount",
                                  keyboardType: TextInputType.number))
                        ],
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                              child: textformfiles(OpeningController,
                                  hintText: "Opening Stock",
                                  labelText: "Opening Stock",
                                  keyboardType: TextInputType.number)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: textformfiles(ColoseController,
                                  hintText: Closingtext,
                                  labelText: Closingtext,
                                  keyboardType: TextInputType.number))
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Checkbox(
                                activeColor: AppColor.kBlue,
                                value: isshowdata,
                                onChanged: (e) {
                                  setState(() {
                                    isshowdata = !isshowdata;
                                  });
                                }),
                          ),
                          Text(
                            " Discontinue",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            partmasteraDeta();
                          },
                          child: Button("Save")),
                      addVerticalSpace(10),
                      redButton(delettxt),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<void> HsnIdScreenapi() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetHSNMaster');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Websitmodal> selecthsnList =
            websitmodalFromJson(response.body);
        setState(() {
          hsnModels = selecthsnList
              .map((item) => {'hsn_Id': item.hsnId, 'hsn_Code': item.hsnCode})
              .toList();
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> HsnIdScreenapi() async {
  //   print(1);
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'http://lms.muepetro.com/api/UserController1/GetHSNMaster'));
  //     print(2);
  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);
  //       setState(() {
  //         hsnModels = (jsonData as List)
  //             .map((data) => Websitmodal.fromJson(data))
  //             .toList();
  //         print(3);
  //       });
  //     } else {
  //       print('Failed to load data: ${response.statusCode}');
  //     }
  //     print(4);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Future<void> partmasteraDeta() async {
    print('1');
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/PostItemMaster');
    final Map<String, dynamic> body = {
      "Item_Name": "${PartNoumbarController.text.toString()}",
      "Item_Des": '${partnamecontroller.text}',
      "Group_Id": groupid ?? 0,
      "CategoryId": 1,
      "Manufacturer_Id": selectedManufacturer?['id'] ?? 0,
      "Supplier_Id": 1,
      "Unit_Id": 1,
      "Location_Id": 12,
      "Mrp": double.parse(MrpController.text),
      "Ndp": double.parse(NdpController.text),
      "Discount": 2,
      "Gst": 18,
      "Order_Qty": 1,
      "Margin": 0,
      "Opening_Stock": 10,
      "Stock_Qty": 10,
      "Bin_No": "${BillNoController.text.toString()}",
      "Sale_Price": 100,
      "Hsn_Id": hsnId ?? 0,
      "Hsn_Code": "0",
      "Igst": "${IgstController.text.toString()}",
      "Cgst": "${CgstController.text.toString()}",
      "Sgst": "${SgstController.text.toString()}",
      "Cess": "1",
      "AlternPartNo": "",
      "Min_Stock": OpeningController.text.isNotEmpty
          ? double.parse(OpeningController.text)
          : 0.0,
      "Max_Stock": 100,
      "Moq": 5,
      "Roi": 12,
      "PartStatus": 1,
      "Status": 1,
      "Remarks": "remarks",
      "CreatedBy": 12,
      "CreatedDate": "09/12/2023",
      "UpdateBy": 2,
      "UpdatedDate": "09/12/2023"
    };

    print('2');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      print('3');

      var data = jsonDecode(response.body);
      print('API Response: $data');
      print('4');

      if (response.statusCode == 200) {
        if (data['result'] == true) {
          Get.snackbar(
            'Success',
            'API call was successful!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          print('5');
          print('API call successful');
        } else {
          // Handle API call failure
          print('API call failed');
          if (data['message'] != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(data['message']),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
        print('6');
      } else {
        // Handle non-200 status code
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
      print('7');
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
    }
  }

  Future<void> groupData() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=${modal().group}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        drop.clear();
        drop.add({'id': 0, 'name': 'Select Group'});
        for (var item in goruppartmodelList) {
          drop.add({'id': item.id, 'name': item.name});
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> manufutureurData() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=${modal().ledger_group}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Manufacturemodeldeta> manufacturerList =
            manufacturemodeldetaFromJson(response.body);
        setState(() {
          manufacturers = manufacturerList
              .map((item) =>
                  {'id': item.titleId, 'ledger_Name': item.ledgerName})
              .toList();
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
