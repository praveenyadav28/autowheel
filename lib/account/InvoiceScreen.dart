// ignore_for_file: unused_local_variable, unused_label, unused_import

import 'dart:convert';
import 'package:autowheelapp/labour/Addlabour.dart';

import 'package:autowheelapp/models/Staffmodelpage.dart';
import 'package:autowheelapp/models/hsnmodel.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/Jobcard/Addpart.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/learnng.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class InvoiveScreen extends StatefulWidget {
  InvoiveScreen({super.key});

  @override
  State<InvoiveScreen> createState() => _InvoiveScreenState();
}

late TimeOfDay selectedTime2 = TimeOfDay.now();

class _InvoiveScreenState extends State<InvoiveScreen> {
  final InvoiceController invoiceController = Get.put(InvoiceController());
  String so = "Model";
  List co = ['Model', 'Case Book', 'Sbi Bank'];
  String cr = "Sales Man";
  List dr = ['Sales Man', 'Case Book', 'Sbi Bank'];
  String Place = "place of supplying";
  List Supping = ['place of supplying', 'Case Book', 'Sbi Bank'];
//////staff
  String selectedStaffId = '';
  List<String> options = [];
  List<Staffmodel> staffList = [];
  String staffName = "John Doe";
  ///////
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  String Parsant = "Payment Mode";
  List Mode = ['Payment Mode', 'Case Book', 'Sbi Bank'];
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  TextEditingController mobilecontroller = TextEditingController();
  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime2,
    );
    if (picked != null && picked != selectedTime2) {
      setState(() {
        selectedTime2 = picked;
      });
    }
  }

  List<Map<String, dynamic>> dealer = [];
  List<Map<String, dynamic>> manufacturers = [];
  Map<String, dynamic>? selectedManufacturer;
  int? selectedRadio;
  final StdController = TextEditingController();

  var isshow = false;
  var chack = false;
  var Right = false;
  var Wathsap = false;
  var job = true;
  var h, w;

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;

      if (val == 2) {
        manufutureurData(7);
      } else if (val == 3) {
        manufutureurData(10);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
    staff();
    loction();
    manufutureurData(7);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        title: Text("Invoice"),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: datepickar3,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 52.0, color: Colors.red),
                        ),
                        contentPadding: EdgeInsets.all(5),
                        labelText: "Date",
                        prefixIcon: Icon(
                          Icons.edit_calendar,
                          color: AppColor.kBlack,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            datepickar3.text =
                                DateFormat('dd-MM-yyyy').format(selectedDate);
                          }
                        });
                      },
                    ),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectTime2(context);
                      },
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "${selectedTime2.format(context)}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(child: textfild("slnv no. ")),
                  addhorizontalSpace(
                    10,
                  ),
                  Expanded(child: textfild("Invoic name"))
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          job = true; // Set 'job' to true to select "Counter".
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: job ? Color(0xff83c5be) : AppColor.kBlack,
                              width: 2),
                          borderRadius: BorderRadius.circular(25),
                          color: job
                              ? Color(0xff83c5be)
                              : Color(
                                  0x00000000), // Add background color for selected item
                        ),
                        child: Center(
                            child: Text(
                          "Counter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: job
                                ? Colors.white
                                : AppColor
                                    .kBlack, // Change text color based on selection
                          ),
                        )),
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          job = false; // Set 'job' to false to select "Job".
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: !job ? Color(0xff83c5be) : Colors.black,
                              width: 2),
                          color: !job
                              ? Color(0xff83c5be)
                              : Colors
                                  .transparent, // Add background color for selected item
                        ),
                        child: Center(
                            child: Text(
                          "Searvice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !job
                                ? Colors.white
                                : AppColor
                                    .kBlack, // Change text color based on selection
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.kWhite,
                  border: Border.all(color: AppColor.kBlack, width: 2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setSelectedRadio(1);
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          selectedManufacturer = null;
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Cash  ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setSelectedRadio(2);
                            },
                            child: Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                selectedManufacturer = null;
                                setSelectedRadio(val);
                              },
                            ),
                          ),
                          Text(
                            'Card  ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Radio(
                            value: 3,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              selectedManufacturer = null;
                              setSelectedRadio(val);
                            },
                          ),
                          Text(
                            'Credit',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(10),
              textfild("Party Name"),
              addVerticalSpace(10),
              textfild("Address "),

              addVerticalSpace(10),

              textformfiles(mobilecontroller,
                  keyboardType: TextInputType.number,
                  labelText: "Mobile No.",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      'assets/mobilenumbar.png',
                      height: 20,
                    ),
                  )),
              addVerticalSpace(10),
              CSCPicker(
                showStates: true,
                showCities: true,
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    )),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    // color: Colors.grey.shade300,
                    border: Border.all(
                      width: 2,
                      color: AppColor.kBlack,
                    )),
                countryDropdownLabel: "Select Country",
                stateDropdownLabel: " Select State",
                cityDropdownLabel: " Select City",
                selectedItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                dropdownHeadingStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                dropdownItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  setState(() {
                    countrySearchPlaceholder:
                    "$StdController";
                    stateSearchPlaceholder:
                    "$cityValue";
                    citySearchPlaceholder:
                    "City";

                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = "$stateValue";
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = "$countryValue";
                  });
                },
              ),

              // textfild("Mobile No."),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: textfild("Vehicle no."),
                  ),
                  addhorizontalSpace(10),
                  Expanded(child: textfild("Km"))
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: so,
                        dropdownColor: Color.fromRGBO(211, 247, 212, 1),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: co.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            so = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        // Get.to(ColorsScreen());
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
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColor.kWhite,
                              ),
                              underline: Container(),
                              value: selectedStaffId,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedStaffId = newValue!;
                                });
                              },
                              items: options.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        // Get.to(ColorsScreen());
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
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: Place,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: Supping.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Place = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        // Get.to(ColorsScreen());
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
                      padding: EdgeInsets.all(5),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        underline: Container(),
                        value: selectedId3,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: MediaQuery.of(context).size.height * 0.030,
                          color: Colors.black, // AppColor.kBlack,
                        ),
                        isExpanded: true,
                        items: Loctionshow.map((value) {
                          return DropdownMenuItem(
                            value: value['id'],
                            child: Text(
                              '${value['id']} -${value['location_Name']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedId3 = value as int;
                            loctionid = selectedId3;
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        // Get.to(ColorsScreen());
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
              InkWell(
                  onTap: () {
                    Get.to(addpartsScreen());
                  },
                  child: Button("Add Parts")),
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    Get.to(JobcardLabourscreen());
                  },
                  child: Button("Add Labour")),
              addVerticalSpace(10),
              Obx(() =>
                  Rowdata("Total spare", "${invoiceController.totalSpare}")),
              addVerticalSpace(10),
              Obx(() =>
                  Rowdata("Total Labour", "${invoiceController.totalLabour}")),
              addVerticalSpace(10),
              Obx(() => Rowdata("IGST", "${invoiceController.totalGst}")),
              addVerticalSpace(10),
              Rowdata("SGST", "0.0"),
              addVerticalSpace(10),
              Rowdata("CGST", "0.0"),
              addVerticalSpace(10),
              Rowdata("discount", "0000"),
              addVerticalSpace(10),
              Obx(() => Rowdata("Net Amount",
                  "${invoiceController.totalSpare.toInt() + invoiceController.totalLabour.toInt() + invoiceController.totalGst.toInt()}")),
              addVerticalSpace(10),

              Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                      Wathsap = !Wathsap;
                    },
                    child: Row(
                      children: [
                        Align(
                          child: SizedBox(
                            width: 13,
                            child: Checkbox(value: Wathsap, onChanged: (e) {}),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textcostam(
                            "Sand Whatsapp after save", 16, AppColor.kBlack),
                      ],
                    ),
                  )),
              addVerticalSpace(10),
              Button("Save"),
              addVerticalSpace(10),
              redButton(delettxt),

              addVerticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textfild(String? labelText) {
    return TextFormField(
      // keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onChanged: (value) {},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.red),
        ),
        counterText: "",
        labelText: labelText,
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(),
      ),
    );
  }

  Row Rowdata(String txt, String txt1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          height: 35,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.kBlack),
            // border: (),
            color: AppColor.kWhite,
            borderRadius: BorderRadius.circular(5),
            // boxShadow: [BoxShadow(blurRadius: 2, color: AppColor.kGray)]
          ),
          child: Center(
            child: Text(
              txt1,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> staff() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetStaff');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;

        staffList = data.map((map) => Staffmodel.fromJson(map)).toList();

        if (staffList.isEmpty) {
          print('Staff not found with Name: $staffName');
        } else {
          setState(() {
            options = staffList.map((staff) => staff.staffName).toList();
            selectedStaffId =
                staffList.first.staffName; // Set the default selected staff ID
          });
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> loction() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetLocation');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body) as List<dynamic>;
      print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          Loctionshow.add({'id': 0, 'location_Name': 'Select a Location'});
          Loctionshow.addAll(data.cast<Map<String, dynamic>>());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> manufutureurData(int ledgerGroupId) async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=$ledgerGroupId');
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
