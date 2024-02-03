import 'dart:convert';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/models/hsnmodel.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/screen/master/HsnCategary.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
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
  // int selectedHsnIdScreen = 0;
  var HSN_ID;

  String singleoutlate1 = "Single Outlet";

  List<Websitmodal> hsnModels = [];
  String selectedGroupName = "Select Group";
  int? selectedGroupId;
  List<Map<String, dynamic>> drop = [
    {'id': 0, 'name': 'Select Group'}
  ];
  Map<String, dynamic>? selectedManufacturer;
  var manufactureValue;

  double igstValue = 0.0;
  double cgstValue = 0.0;
  double sgstValue = 0.0;

  List<Map<String, dynamic>> manufacturers = [];
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
    // PartNoumbarController.text = widget.gst.toString();
    // MrpController.text = widget.netAmmount.toString();

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
                        // ignore: body_might_complete_normally_nullable
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
                            padding: const EdgeInsets.all(8),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              underline: Container(),
                              value: selectedGroupName,
                              dropdownColor:
                                  const Color.fromARGB(255, 211, 247, 212),
                              icon: Icon(Icons.keyboard_arrow_down_outlined,
                                  size: h * 0.030, color: AppColor.kBlack),
                              isExpanded: true,
                              items: drop.map((item) {
                                return DropdownMenuItem(
                                  value: item['name'],
                                  child: Text(
                                    item['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedGroupName = value.toString();
                                  selectedGroupId = drop
                                          .firstWhere(
                                              (item) => item['name'] == value)
                                          .containsKey('id')
                                      ? drop.firstWhere(
                                          (item) => item['name'] == value)['id']
                                      : null;
                                });
                              },
                            ),
                          )),
                          addhorizontalSpace(10),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () async {
                                String refreshResult = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Group1Screen(
                                              SourecID: 1,
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
                              padding: const EdgeInsets.all(8),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: AppColor.kBlack,
                                ),
                                underline: Container(),
                                value: selectedManufacturer,
                                hint: Text(
                                  "Select Manufacturer.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.kBlack),
                                ),
                                isExpanded: true,
                                items: manufacturers.map((data) {
                                  return DropdownMenuItem(
                                    value: data,
                                    child: Text(
                                      '${data['id']} - ${data['ledger_Name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  selectedManufacturer =
                                      // ignore: unnecessary_cast
                                      value as Map<String, dynamic>?;
                                  debugPrint("value  ${selectedManufacturer}");
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
                            child: Container(
                              // padding: const EdgeInsets.all(8),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonFormField(
                                value: hsnModels.isNotEmpty
                                    ? hsnModels.first.hsnCode
                                    : null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: AppColor.kGray)),
                                  hintText: 'Select Hsn Code',
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  // labelText: 'Select Hsn Code',
                                  contentPadding: EdgeInsets.all(5),
                                ),
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: h * 0.030,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                items: hsnModels.map((model) {
                                  return DropdownMenuItem(
                                    value: model.hsnCode,
                                    child: Text(model.hsnCode),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  singleoutlate1 = value.toString();
                                  Websitmodal selectedModel =
                                      hsnModels.firstWhere(
                                          (model) => model.hsnCode == value);
                                  HSN_ID = selectedModel.hsnId;
                                  print('Selected HSN ID: $HSN_ID');
                                  IgstController.text =
                                      selectedModel.igst.toString();
                                  CgstController.text =
                                      selectedModel.cgst.toString();
                                  SgstController.text =
                                      selectedModel.sgst.toString();

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
                                  textfild(igsttext, IgstController,
                                      TextInputType.number, true, "")
                                ],
                              ),
                            ),
                            addhorizontalSpace(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textfild(cgsttxt, CgstController,
                                      TextInputType.number, true, "")
                                ],
                              ),
                            ),
                            addhorizontalSpace(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textfild(sgstxt, SgstController,
                                      TextInputType.number, true, "")
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
                                    labelText: "MRP",
                                    keyboardType: TextInputType.number,
                                    hintText: "0.00",
                                  )
                                ],
                              ),
                            ),
                            addhorizontalSpace(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textfild(BillNo, BillNoController,
                                      TextInputType.number, false, "0.00")
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
                      // Text(
                      //   'Selected Group Name: $selectedGroupName',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      // Text(
                      //   'Selected Group ID: ${selectedGroupId ?? "Select a Group"}',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      // Text(
                      //   'Selected Manufacturer ID: ${selectedManufacturer?['id'] ?? "Select a Manufacturer"}',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      // Text(
                      //   'Selected Manufacturer Name: ${selectedManufacturer?['ledger_Name'] ?? "Select a Manufacturer"}',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  TextFormField textfild(String? labelText, TextEditingController? controller,
      TextInputType? keyboardType, bool readOnly, String? hintText) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      // onChanged: (value) {},
      decoration: InputDecoration(
          hintText: hintText,
          counterText: "",
          labelText: labelText,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 5.0, color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 5),
          )),
    );
  }

  Future<void> HsnIdScreenapi() async {
    print(1);
    try {
      final response = await http.get(Uri.parse(
          'http://lms.muepetro.com/api/UserController1/GetHSNMaster'));
      print(2);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          hsnModels = (jsonData as List)
              .map((data) => Websitmodal.fromJson(data))
              .toList();
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

  Future<void> partmasteraDeta() async {
    print('1');
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/PostItemMaster');
    final Map<String, dynamic> body = {
      "Item_Name": PartNoumbarController.text.toString(),
      "Item_Des": '${partnamecontroller.text}',
      "Group_Id": selectedGroupId ?? 0,
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
      "Bin_No": BillNoController.text.toString(),
      "Sale_Price": 100,
      "Hsn_Id": HSN_ID ?? 0,
      "Hsn_Code": "0",
      "Igst": IgstController.text.toString(),
      "Cgst": CgstController.text.toString(),
      "Sgst": SgstController.text.toString(),
      "Cess": "1",
      "AlternPartNo": "",
      // "Min_Stock": double.parse(OpeningController.text),
      "Min_Stock": OpeningController.text.isNotEmpty
          ? double.parse(OpeningController.text)
          : 0.0,

      // "Min_Stock": OpeningController.text.toString(),
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
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=1');
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
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=9');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Manufacturemodeldeta> manufacturerList =
            manufacturemodeldetaFromJson(response.body);
        // for (int i = 0; i <= manufacturerList.length; i++) {
        //   DemoModal modal = DemoModal();
        //   modal.id = manufacturerList[i].titleId;
        //   modal.name = manufacturerList[i].ledgerName;
        //   manufacturers.add(modal);

        //   // manufacturers.addAll(DemoModal(
        //   //     id: manufacturerList[i].titleId,
        //   //     name: manufacturerList[i].titleId));
        // }
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
