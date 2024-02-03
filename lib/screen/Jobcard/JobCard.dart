// ignore_for_file: unused_local_variable, unused_import, unused_element

import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/Intro/Login_screen.dart';
import 'package:autowheelapp/screen/Jobcard/Colorscreen.dart';
import 'package:autowheelapp/screen/Jobcard/Modeldata.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/StaffMaster.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/Textfid.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class JobCardScreen extends StatefulWidget {
  const JobCardScreen({super.key});
  @override
  State<JobCardScreen> createState() => _JobCardScreenState();
}

String selectedData = '';
var h, w;
var _switchValue = false;
bool index = false;
var visiable = false;
var isgear = false;
var isbrake = false;
var iscool = false;
var isbattry = false;
var iscluth = false;
var isfree = false;
var isallhouse = false;
var isunderbody = false;
var istyre = false;
var iswiper = false;
var isnozzle = false;
var isac = false;
var ischack = false;
DateTime now = DateTime.now();
String currentTime = "${now.hour}:${now.minute}:${now.second}";
TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController datepickar3 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController vicalcontiner = TextEditingController();
TextEditingController chassisnocontroller = TextEditingController();
TextEditingController EnginController = TextEditingController();
TextEditingController jobcardnumbarcontroller = TextEditingController();
TextEditingController kmscontroller = TextEditingController();
TextEditingController fuelcontroller = TextEditingController();

class _JobCardScreenState extends State<JobCardScreen> {
  late TimeOfDay selectedTime;
  // Api color
  List<Map<String, dynamic>> color = [
    {'id': 0, 'name': 'Colors'}
  ];
  String selectedcolorName = "Colors";
  int? selectedcolorsId;
  // Api searcive type
  List<Map<String, dynamic>> SearviceType = [
    {'id': 0, 'name': 'Service type*'}
  ];
  String selectedSearviceName = "Service type*";
  int? selectedSearviceId;
  // Api searvice numbar
  List<Map<String, dynamic>> SearviceNumbar = [
    {'id': 0, 'name': 'Service Number*'}
  ];
  String selectedSearviceNumbarName = "Service Number*";
  int? selectedSearviceNumbarId;
  // api machanic
  List<Map<String, dynamic>> SelectMachanic = [
    {'id': 0, 'name': 'Select Machanic*'}
  ];
  String selectedSelectMachanicName = "Select Machanic*";
  int? selectedSelectMachanicId;
  // api seavice manager
  List<Map<String, dynamic>> WorkManager = [
    {'id': 0, 'name': 'select Work Manager'}
  ];
  String selectedWorkManagerName = "select Work Manager";
  int? selectedWorkManagerId;

  // Api
  List<Map<String, dynamic>> manufacturers = [];
  Map<String, dynamic>? selectedManufacturer;
  var manufactureValue;

  String Model = "Model Name";
  List Name = [
    'Model Name',
    'black',
    'red',
    'green',
    "ambar",
    "gray",
    "yellow"
  ];
  TimeOfDay selectedTime2 = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

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

  refreshData() async {
    await colorDeta();
    searvicetypeDeta();
    SearviceNumbarDeta();
    SelectMachanicDeta();
    WorkManagerDeta();
    CoustomerDetails();
  }

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
    startTimer();
    selectedTime2;
    searvicetypeDeta();
    colorDeta();
    SearviceNumbarDeta();
    SelectMachanicDeta();
    WorkManagerDeta();
    CoustomerDetails();
  }

  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        selectedTime = TimeOfDay.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColor.kBlack,
            ),
          )
        ],
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        toolbarHeight: 40,
        title: Text(
          jobcardtxt,
          style: TextStyle(color: AppColor.kBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        controller: datepickar1,
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
                                  BorderSide(width: 5.0, color: Colors.red),
                            ),
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: datetxt,
                            helperStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
                              .then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar1.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                      child: textformfiles(jobcardnumbarcontroller,
                          labelText: jobcardnoumbartxt,
                          keyboardType: TextInputType.number))
                ],
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Customer details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
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
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.kBlack,
                        ),
                        underline: Container(),
                        value: selectedManufacturer,
                        hint: Text(
                          "Customer details.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kBlack),
                        ),
                        items: manufacturers.map((data) {
                          return DropdownMenuItem(
                            value: data,
                            child: Text(
                              '${data['id']} - ${data['ledger_Name']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // ignore: unnecessary_cast
                          selectedManufacturer = value as Map<String, dynamic>?;
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
                        Get.to(LedgerScreen());
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Vehicle Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
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
                        value: Model,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: Name.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Model = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      // onTap: () {
                      //   Get.to(AddCustomerflotScreen());
                      // },
                      onTap: () {
                        Get.to(Addmodel());
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
              textformfiles(vicalcontiner,
                  labelText: VehicalNotxt,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      imgcar,
                      height: 15,
                    ),
                  )),
              addVerticalSpace(10),
              textformfiles(chassisnocontroller,
                  labelText: Chassistxt,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      chessisimg,
                      height: 15,
                    ),
                  )),
              addVerticalSpace(10),
              textformfiles(EnginController,
                  labelText: Engintxt,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      enginimg,
                      height: 15,
                    ),
                  )),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedcolorName,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          size: h * 0.030, color: AppColor.kBlack),
                      isExpanded: true,
                      items: color.map((item) {
                        return DropdownMenuItem(
                          value: item['name'],
                          child: Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedcolorName = value.toString();
                          selectedcolorsId = color
                                  .firstWhere((item) => item['name'] == value)
                                  .containsKey('id')
                              ? color.firstWhere(
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
                      onTap: () {
                        Get.to(() => Group1Screen(SourecID: 17))!
                            .then((value) => refreshData());
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
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedSearviceName,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          size: h * 0.030, color: AppColor.kBlack),
                      isExpanded: true,
                      items: SearviceType.map((item) {
                        return DropdownMenuItem(
                          value: item['name'],
                          child: Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSearviceName = value.toString();
                          selectedSearviceId = SearviceType.firstWhere(
                                      (item) => item['name'] == value)
                                  .containsKey('id')
                              ? SearviceType.firstWhere(
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
                      onTap: () {
                        Get.to(() => Group1Screen(SourecID: 28))!
                            .then((value) => refreshData());
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
              Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  underline: Container(),
                  value: selectedSearviceNumbarName,
                  dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                  icon: Icon(Icons.keyboard_arrow_down_outlined,
                      size: h * 0.030, color: AppColor.kBlack),
                  isExpanded: true,
                  items: SearviceNumbar.map((item) {
                    return DropdownMenuItem(
                      value: item['name'],
                      child: Text(
                        item['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSearviceNumbarName = value.toString();
                      selectedSearviceNumbarId = SearviceNumbar.firstWhere(
                              (item) => item['name'] == value).containsKey('id')
                          ? SearviceNumbar.firstWhere(
                              (item) => item['name'] == value)['id']
                          : null;
                    });
                  },
                ),
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: textformfiles(
                    kmscontroller,
                    keyboardType: TextInputType.number,
                    labelText: 'Kms',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        kmsimg,
                        height: 25,
                      ),
                    ),
                  )),
                  addhorizontalSpace(10),
                  Expanded(
                      child: textformfiles(
                    kmscontroller,
                    keyboardType: TextInputType.number,
                    labelText: 'Fuel',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        fuelimg,
                        height: 25,
                      ),
                    ),
                  )),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child:
                        Text("Vehicle Accessories details", style: vishalstayl),
                  ),
                  InkWell(
                    onTap: () {
                      index = index;
                      setState(() {
                        // visiable = !visiable;
                      });
                    },
                    child: Checkbox(
                      value: _switchValue,
                      onChanged: (bool? value) {
                        setState(() {
                          _switchValue = !_switchValue;
                          visiable = !visiable;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: visiable,
                child: Column(
                  children: [
                    chackbox(
                      isshow,
                      (e) {
                        setState(() {
                          isshow = !isshow;
                        });
                      },
                      "Booklet/documets",
                    ),
                    chackbox(
                      isgear,
                      (e) {
                        setState(() {
                          isgear = !isgear;
                        });
                      },
                      "Spar Wheel",
                    ),
                    chackbox(
                      isbrake,
                      (e) {
                        setState(() {
                          isbrake = !isbrake;
                        });
                      },
                      "Jack handle",
                    ),
                    chackbox(
                      iscool,
                      (e) {
                        setState(() {
                          iscool = !iscool;
                        });
                      },
                      "Mats",
                    ),
                    chackbox(
                      isbattry,
                      (e) {
                        setState(() {
                          isbattry = !isbattry;
                        });
                      },
                      "Carpets",
                    ),
                    chackbox(
                      iscluth,
                      (e) {
                        setState(() {
                          iscluth = !iscluth;
                        });
                      },
                      "Stereo",
                    ),
                    chackbox(
                      isfree,
                      (e) {
                        setState(() {
                          isfree = !isfree;
                        });
                      },
                      "Clock",
                    ),
                    chackbox(
                      isallhouse,
                      (e) {
                        setState(() {
                          isallhouse = !isallhouse;
                        });
                      },
                      "Wheel Cap.Cover",
                    ),
                    chackbox(
                      isunderbody,
                      (e) {
                        setState(() {
                          isunderbody = !isunderbody;
                        });
                      },
                      "Mudflaps",
                    ),
                    chackbox(
                      istyre,
                      (e) {
                        setState(() {
                          istyre = !istyre;
                        });
                      },
                      "Tool Kit",
                    ),
                    chackbox(
                      isnozzle,
                      (e) {
                        setState(() {
                          isnozzle = !isnozzle;
                        });
                      },
                      "perfume",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Mechanic Detalis",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
                    ),
                  )
                ],
              ),
              addVerticalSpace(15),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedSelectMachanicName,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Image.asset(
                        mechanicimg,
                        height: 40,
                      ),
                      isExpanded: true,
                      items: SelectMachanic.map((item) {
                        return DropdownMenuItem(
                          value: item['name'],
                          child: Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSelectMachanicName = value.toString();
                          selectedSelectMachanicId = SelectMachanic.firstWhere(
                                      (item) => item['name'] == value)
                                  .containsKey('id')
                              ? SelectMachanic.firstWhere(
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
                      onTap: () {
                        Get.to(Staff_master());
                        // Get.to(() => Group1Screen(SourecID: 30))!
                        //     .then((value) => refreshData());
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
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedWorkManagerName,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Image.asset(workmanager),
                      isExpanded: true,
                      items: WorkManager.map((item) {
                        return DropdownMenuItem(
                          value: item['name'],
                          child: Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedWorkManagerName = value.toString();
                          selectedWorkManagerId = WorkManager.firstWhere(
                                      (item) => item['name'] == value)
                                  .containsKey('id')
                              ? WorkManager.firstWhere(
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
                      onTap: () {
                        Get.to(Staff_master());
                        // Get.to(() => Group1Screen(SourecID: 31))!
                        //     .then((value) => refreshData());
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Labour Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        // textAlignVertical: TextAlignVertical.bottom,
                        controller: datepickar2,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            // filled: true,
                            // fillColor: Colors.white,
                            labelText: "job in date",
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),

                            // suffixIcon: Image.asset("assets/calender.png"),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
                              .then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar2.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
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
                          "${selectedTime.format(context)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: datepickar3,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      hintText: jobouttxt,
                      prefixIcon: Icon(
                        Icons.edit_calendar,
                        color: AppColor.kBlack,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // Apply bold font weight to the text
                      labelText: "job out date",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, // Make the text bold
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
                  )),
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
                          "${selectedTime.format(context)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    Get.to(JobcardLabourscreen());
                  },
                  child: Button("Add Labour")),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Next Service*",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
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
                          borderSide: BorderSide(width: 2.0, color: Colors.red),
                        ),
                        contentPadding: EdgeInsets.all(5),
                        labelText: ("Numbar of days"),
                        border: OutlineInputBorder()),
                  )),
                  addhorizontalSpace(10),
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        // textAlignVertical: TextAlignVertical.bottom,
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
                            contentPadding: EdgeInsets.all(5),
                            // filled: true,
                            // fillColor: Colors.white,
                            hintText: "Date",
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
                              .then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar3.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Insurance reminder*",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
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
                          borderSide: BorderSide(width: 2.0, color: Colors.red),
                        ),
                        contentPadding: EdgeInsets.all(5),
                        labelText: ("days"),
                        border: OutlineInputBorder()),
                  )),
                  addhorizontalSpace(10),
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        // textAlignVertical: TextAlignVertical.bottom,
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
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            // filled: true,
                            // fillColor: Colors.white,
                            labelText: "Date",
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
                              .then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar3.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                ],
              ),
              addVerticalSpace(10),
              InkWell(onTap: () {}, child: Button(savetxt)),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                    child: Checkbox(
                        value: ischack,
                        onChanged: (e) {
                          setState(() {
                            ischack = !ischack;
                          });
                        }),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                      child: Text(
                    "  Print",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                    child: Checkbox(
                        value: isshow,
                        onChanged: (e) {
                          setState(() {
                            isshow = !isshow;
                          });
                        }),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                      child: Text(
                    "  Send sms",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> colorDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=17');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        color.clear();
        color.add({'id': 0, 'name': 'Colors'});
        for (var item in goruppartmodelList) {
          color.add({'id': item.id, 'name': item.name});
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

  Future<void> searvicetypeDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=28');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        SearviceType.clear();
        SearviceType.add({'id': 0, 'name': 'Service type*'});
        for (var item in goruppartmodelList) {
          SearviceType.add({'id': item.id, 'name': item.name});
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

  Future<void> SearviceNumbarDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=29');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        SearviceNumbar.clear();
        SearviceNumbar.add({'id': 0, 'name': 'Service Number*'});
        for (var item in goruppartmodelList) {
          SearviceNumbar.add({'id': item.id, 'name': item.name});
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

  Future<void> SelectMachanicDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=30');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        SelectMachanic.clear();
        SelectMachanic.add({'id': 0, 'name': 'Select Machanic*'});
        for (var item in goruppartmodelList) {
          SelectMachanic.add({'id': item.id, 'name': item.name});
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

  Future<void> WorkManagerDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=31');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        WorkManager.clear();
        WorkManager.add({'id': 0, 'name': 'select Work Manager'});
        for (var item in goruppartmodelList) {
          WorkManager.add({'id': item.id, 'name': item.name});
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

  Future<void> CoustomerDetails() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=10');
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
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(),
      ),
    );
  }

  Row chackbox(
    bool? Fristchack,
    Function(bool?)? Fristchange,
    String txt,
  ) {
    return Row(
      children: [
        Checkbox(value: Fristchack, onChanged: Fristchange),
        Text(
          txt,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
