// ignore_for_file: unused_local_variable, duplicate_ignore, unused_element, unnecessary_import
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
// ignore: unused_import
import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/models/Staffmodelpage.dart';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class ProsepetScreen extends StatefulWidget {
  const ProsepetScreen({super.key});
  @override
  State<ProsepetScreen> createState() => _ProsepetScreenState();
}

String countryValue = "";
String stateValue = "";
String cityValue = "";
var ischack = false;
var h, w;
String interset = "Interst";
List set = ['Interst', 'Part'];
String Sale = "SaleEX";
List ex = ['SaleEX', 'Part'];
String product = "product";
List uct = ['product', 'Part'];
String relation = "M/s";
List _relate = ['M/s', 'Mr.', 'Mrs.', "Miss", "Dr."];
TextEditingController NameController = TextEditingController();
TextEditingController SoController = TextEditingController();
TextEditingController Addresscontroller = TextEditingController();
TextEditingController PinController = TextEditingController();
TextEditingController MobileControleer = TextEditingController();
TextEditingController StdController = TextEditingController();
TextEditingController Emailcontroller = TextEditingController();
TextEditingController SchemeController = TextEditingController();
TextEditingController IncomeController = TextEditingController();
TextEditingController RemarksController = TextEditingController();
TextEditingController RemarksController2 = TextEditingController();
TextEditingController SplRemarks = TextEditingController();
TextEditingController refController = TextEditingController();

TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar3 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar4 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar5 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar6 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
List<String> detailsList1 = []; // List to store details
bool isLoading = false;
// Api
List<Map<String, dynamic>> drop = [
  {'id': 0, 'name': 'Source'}
];
String selectedGroupName = "Source";
int? selectedGroupId;
//Api colors
List<Map<String, dynamic>> color = [
  {'id': 0, 'name': 'Colors'}
];
String selectedcolorName = "Colors";
int? selectedcolorsId;
//Api Enq.type
List<Map<String, dynamic>> Enqtype = [
  {'id': 0, 'name': 'Enqtype'}
];
String selectedEnqtypeName = "Enqtype";
int? selectedEnqtypeId;
// Api Occuption
List<Map<String, dynamic>> Occuption = [
  {'id': 0, 'name': 'Occuption'}
];
String selectedOccuptionName = "Occuption";
int? selectedOccuptionId;
// api Prionaity
List<Map<String, dynamic>> Prionaity = [
  {'id': 0, 'name': 'Prionaity'}
];
String selectedPrionaityName = "Prionaity";
int? selectedPrionaityId;
// api produst
List<Map<String, dynamic>> produst = [
  {'id': 0, 'name': 'produst'}
];
String selectedprodustName = "produst";
int? selectedprodustId;
// Api test ride
List<Map<String, dynamic>> Test = [
  {'id': 0, 'name': 'Test'}
];
String selectedTestName = "Test";
int? selectedTestId;
// Api title
List<Map<String, dynamic>> title = [
  {'id': 0, 'name': 'title'}
];
String selectedtitleName = "title";
int? selectedtitleId;

class _ProsepetScreenState extends State<ProsepetScreen> {
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  List<String> options = [];
  List<Staffmodel> staffList = [];
  String staffName = "John Doe";
  String selectedStaffId = '';
  Future<void> _selectTime1(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
    );
    if (picked != null && picked != selectedTime1) {
      setState(() {
        selectedTime1 = picked;
      });
    }
  }

  late TimeOfDay selectedTime1;
  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        selectedTime1 = TimeOfDay.now();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    selectedTime1 = TimeOfDay.now();
    startTimer();
    // selectedTime2;
    loction();
    staff();
    sourceDeta();
    colorDeta();
    enqtypeDeta();
    occuptionDeta();
    prionaityDeta();
    produstDeta();
    TestDeta();
    titleDeta();
    _fetchRefNo();
    // postProspect();
  }

  refreshData() async {
    await sourceDeta();
    colorDeta();
    enqtypeDeta();
    occuptionDeta();
    prionaityDeta();
    produstDeta();
    TestDeta();
    titleDeta();
    _fetchRefNo();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        elevation: 2,
        // leadingWidth: 20,
        backgroundColor: AppColor.kappabrcolr,

        title: Text(
          "Prospect Masters",
          style: TextStyle(color: AppColor.kBlack),
        ),
        // SizedBox(width: 13),
      ),
      body: Loctionshow.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
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
                            loctionid =
                                selectedId3; // Assign the selected ID directly
                          });
                        },
                      ),
                    ),
                    addVerticalSpace(10),
                    textformfiles(refController,
                        keyboardType: TextInputType.number,
                        readOnly: true,
                        hintText: "Ref.NO",
                        labelText: "Ref.No"),
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
                              labelText: "date",
                              labelStyle: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
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
                                  datepickar1.text = DateFormat('yyyy/MM/dd')
                                      .format(selectedDate);
                                  print(datepickar1.text.toString());
                                }
                              });
                            },
                          ),
                        ),
                        addhorizontalSpace(10),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            _selectTime1(context);
                          },
                          child: Container(
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                "${selectedTime1.format(context)}",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
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
                              value: selectedtitleName,
                              dropdownColor:
                                  const Color.fromARGB(255, 211, 247, 212),
                              icon: Icon(Icons.keyboard_arrow_down_outlined,
                                  size: h * 0.030, color: AppColor.kBlack),
                              isExpanded: true,
                              items: title.map((item) {
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
                                  selectedtitleName = value.toString();
                                  selectedtitleId = title
                                          .firstWhere(
                                              (item) => item['name'] == value)
                                          .containsKey('id')
                                      ? title.firstWhere(
                                          (item) => item['name'] == value)['id']
                                      : null;
                                  log(selectedtitleId.toString());
                                });
                              },
                            ),
                          ),
                        ),
                        addhorizontalSpace(10),
                        Expanded(
                          child: textformfiles(NameController,
                              hintText: "Name*", labelText: "Name*"),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    textformfiles(SoController,
                        hintText: "S/o", labelText: "S/o"),
                    addVerticalSpace(10),
                    textformfiles(Addresscontroller,
                        hintText: "Address", labelText: "Address"),
                    addVerticalSpace(10),
                    CSCPicker(
                      showStates: true,
                      showCities: true,
                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          )),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2)),
                      countryDropdownLabel: "Select Country *",
                      stateDropdownLabel: " Select State *",
                      cityDropdownLabel: " Select City *",
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dropdownDialogRadius: 10.0,
                      searchBarRadius: 10.0,
                      onCountryChanged: (value) {
                        setState(() {
                          // ignore: unused_label
                          countrySearchPlaceholder:
                          "$cityValue";
                          // ignore: unused_label
                          stateSearchPlaceholder:
                          "$cityValue";
                          // ignore: unused_label
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
                    addVerticalSpace(10),
                    textformfiles(PinController,
                        hintText: "Pin",
                        labelText: "Pin",
                        keyboardType: TextInputType.number),
                    addVerticalSpace(10),
                    textformfiles(MobileControleer,
                        hintText: "Mobile*",
                        labelText: "Mobile*",
                        keyboardType: TextInputType.number),
                    addVerticalSpace(10),
                    textformfiles(StdController,
                        hintText: "Std", labelText: "Std"),
                    addVerticalSpace(10),
                    textformfiles(Emailcontroller,
                        hintText: "Email", labelText: "Email"),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
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
                              hintText: jobouttxt,
                              prefixIcon: Icon(
                                Icons.edit_calendar,
                                color: AppColor.kBlack,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // Apply bold font weight to the text
                              labelText: "date",
                              labelStyle: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
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
                                  datepickar2.text = DateFormat('yyyy/MM/dd')
                                      .format(selectedDate);
                                  print(datepickar2.text.toString());
                                }
                              });
                            },
                          ),
                        ),
                        addhorizontalSpace(10),
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
                              labelText: "date",
                              labelStyle: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
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
                                  datepickar3.text = DateFormat('yyyy/MM/dd')
                                      .format(selectedDate);
                                  print(datepickar3.text.toString());
                                }
                              });
                            },
                          ),
                        ),
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
                            value: selectedEnqtypeName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: Enqtype.map((item) {
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
                                selectedEnqtypeName = value.toString();
                                selectedEnqtypeId = Enqtype.firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? Enqtype.firstWhere(
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
                              print("Enqtype");
                              Get.to(() => Group1Screen(SourecID: 18))
                                  ?.then((value) => refreshData());
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
                            value: selectedOccuptionName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: Occuption.map((item) {
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
                                selectedOccuptionName = value.toString();
                                selectedOccuptionId = Occuption.firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? Occuption.firstWhere(
                                        (item) => item['name'] == value)['id']
                                    : null;
                                log(selectedOccuptionId.toString());
                              });
                            },
                          ),
                        )),
                        addhorizontalSpace(10),
                        SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => Group1Screen(SourecID: 23))
                                  ?.then((value) => refreshData());
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
                                    items:
                                        options.map<DropdownMenuItem<String>>(
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
                              // Get.to(Group1Screen());
                              // Get.to(() => Group1Screen());
                              // ?.then((value) => value ? GroupData : null);
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                log(selectedGroupId.toString());
                              });
                            },
                          ),
                        )),
                        addhorizontalSpace(10),
                        SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              // Get.to(Group1Screen());
                              Get.to(() => Group1Screen(SourecID: 10))!
                                  .then((value) => refreshData());
                              // ?.then((value) => value ? GroupData : null);
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
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              underline: Container(),
                              value: interset,
                              dropdownColor:
                                  const Color.fromARGB(255, 211, 247, 212),
                              icon: Icon(Icons.keyboard_arrow_down_outlined,
                                  size: h * 0.030, color: AppColor.kBlack),
                              isExpanded: true,
                              items: set.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  interset = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        addhorizontalSpace(10),
                        SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () {},
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
                            value: selectedPrionaityName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: Prionaity.map((item) {
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
                                selectedPrionaityName = value.toString();
                                selectedPrionaityId = Prionaity.firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? Prionaity.firstWhere(
                                        (item) => item['name'] == value)['id']
                                    : null;
                                log(selectedPrionaityId.toString());
                              });
                            },
                          ),
                        )),
                        addhorizontalSpace(10),
                        SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => Group1Screen(SourecID: 22))
                                  ?.then((value) => refreshData());
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
                    textformfiles(SchemeController,
                        hintText: "Scheme", labelText: "Scheme"),
                    addVerticalSpace(10),
                    textformfiles(IncomeController,
                        hintText: "Income", labelText: "Income"),
                    addVerticalSpace(10),
                    Text(
                      "intersted in following product colour scheme*",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            value: selectedprodustName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: produst.map((item) {
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
                                selectedprodustName = value.toString();
                                selectedprodustId = produst
                                        .firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? produst.firstWhere(
                                        (item) => item['name'] == value)['id']
                                    : null;
                                log(selectedprodustId.toString());
                              });
                            },
                          ),
                        )),
                        addhorizontalSpace(10),
                        SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => Group1Screen(SourecID: 19))
                                  ?.then((value) => refreshData());
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
                            value: selectedcolorName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
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
                                        .firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? color.firstWhere(
                                        (item) => item['name'] == value)['id']
                                    : null;
                                log(selectedcolorsId.toString());
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
                    textformfiles(RemarksController,
                        hintText: "Remmarks", labelText: "Remmarks"),
                    addVerticalSpace(10),
                    Text(
                      "Test Ride*",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            value: selectedTestName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: Test.map((item) {
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
                                selectedTestName = value.toString();
                                selectedTestId = Test.firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? Test.firstWhere(
                                        (item) => item['name'] == value)['id']
                                    : null;
                                log(selectedTestId.toString());
                                // print(selectedTestId.toString());
                              });
                            },
                          ),
                        )),
                        addhorizontalSpace(10),
                        SizedBox(
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => Group1Screen(SourecID: 21))!
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
                    TextFormField(
                      readOnly: true,
                      controller: datepickar4,
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
                        hintText: jobouttxt,
                        prefixIcon: Icon(
                          Icons.edit_calendar,
                          color: AppColor.kBlack,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // Apply bold font weight to the text
                        labelText: "date",
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
                            datepickar4.text =
                                DateFormat('yyyy/MM/dd').format(selectedDate);
                            print(datepickar4.text.toString());
                          }
                        });
                      },
                    ),
                    addVerticalSpace(10),
                    textformfiles(RemarksController2,
                        hintText: "Remmarks", labelText: "Remmarks"),
                    addVerticalSpace(10),
                    Text(
                      "Appointment Date and Time*",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            controller: datepickar5,
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
                              hintText: jobouttxt,
                              prefixIcon: Icon(
                                Icons.edit_calendar,
                                color: AppColor.kBlack,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // Apply bold font weight to the text
                              labelText: "date",
                              labelStyle: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
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
                                  datepickar5.text = DateFormat('yyyy/MM/dd')
                                      .format(selectedDate);
                                  print(datepickar5.text.toString());
                                }
                              });
                            },
                          ),
                        ),
                        addhorizontalSpace(10),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            _selectTime1(context);
                          },
                          child: Container(
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                "${selectedTime1.format(context)}",
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
                    textformfiles(SplRemarks,
                        hintText: "Spl Remarks", labelText: "Spl Remarks"),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: Checkbox(
                              activeColor: AppColor.kBlue,
                              value: ischack,
                              onChanged: (e) {
                                setState(() {
                                  ischack = !ischack;
                                });
                              }),
                        ),
                        Text(
                          "Sent SMS AFter Save",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    addVerticalSpace(10),
                    InkWell(
                        onTap: () {
                          // postProspect();
                          getLocation();
                        },
                        child: Button(savetxt)),
                    addVerticalSpace(10),
                    redButton(delettxt),
                    addVerticalSpace(10),
                  ],
                ),
              ),
            ),
    );
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

  Future<void> sourceDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=10');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        drop.clear();
        drop.add({'id': 0, 'name': 'Source'});
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

  Future<void> enqtypeDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=18');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Enqtype.clear();
        Enqtype.add({'id': 0, 'name': 'Enqtype'});
        for (var item in goruppartmodelList) {
          Enqtype.add({'id': item.id, 'name': item.name});
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

  Future<void> occuptionDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=23');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Occuption.clear();
        Occuption.add({'id': 0, 'name': 'Occuption'});
        for (var item in goruppartmodelList) {
          Occuption.add({'id': item.id, 'name': item.name});
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

  Future<void> prionaityDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=22');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Prionaity.clear();
        Prionaity.add({'id': 0, 'name': 'Prionaity'});
        for (var item in goruppartmodelList) {
          Prionaity.add({'id': item.id, 'name': item.name});
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

  Future<void> produstDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=19');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        produst.clear();
        produst.add({'id': 0, 'name': 'produst'});
        for (var item in goruppartmodelList) {
          produst.add({'id': item.id, 'name': item.name});
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

  Future<void> TestDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=21');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Test.clear();
        Test.add({'id': 0, 'name': 'Test'});
        for (var item in goruppartmodelList) {
          Test.add({'id': item.id, 'name': item.name});
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

  Future<void> titleDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=24');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        title.clear();
        title.add({'id': 0, 'name': 'title'});
        for (var item in goruppartmodelList) {
          title.add({'id': item.id, 'name': item.name});
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

  void postProspect() async {
    print(1);
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostProspect';
    Map<String, dynamic> postData = {
      "Location_Id": loctionid,
      "Prefix_Name": "Online",
      "Ref_No": int.parse(
        refController.text.toString(),
      ),
      "Ref_Date": datepickar1.text,
      "Ref_Time": "${selectedTime1.hour}:${selectedTime1.minute}",
      "Title_id": selectedtitleId,
      "Gender_Name": "Male",
      "Customer_Name": NameController.text.toString(),
      "Contact_Name": "raj1",
      "SanOff_Name": SoController.text.toString(),
      "Address_Details": Addresscontroller.text.toString(),
      "City_Id": "2",
      "City": "jaipur",
      "Pin_Code": PinController.text.toString(),
      "Mob_No": MobileControleer.text.toString(),
      "Phon_No": "phon",
      "Std_Code": StdController.text.toString(),
      "Fax_No": "fax",
      "Email_Id": Emailcontroller.text.toString(),
      "Birthday_Date": datepickar2.text,
      "Anniversary_Date": datepickar3.text,
      "Enq_Type": selectedEnqtypeId,
      "Mode_Type": "modeltype",
      "Occupation": selectedOccuptionId,
      "Income": IncomeController.text.toString(),
      "EnqGenBy_Id": staffList
          .firstWhere((staff) => staff.staffName == selectedStaffId,
              orElse: () => Staffmodel(id: 0, staffName: ''))
          .id,
      "SalesEx_id": staffList
          .firstWhere((staff) => staff.staffName == selectedStaffId,
              orElse: () => Staffmodel(id: 0, staffName: ''))
          .id,
      "Source_Id": selectedGroupId,
      "NoOfVisitor": "NoOfVisitor",
      "Scheme": SchemeController.text.toString(),
      "Priority": selectedPrionaityId,
      "InterestIn": "InterestIn",
      "Model_Id": selectedprodustId,
      "Colour_Id": selectedcolorsId,
      "Remark_interest": "Remark_interest",
      "ModelTest_Id": selectedTestId,
      "ModelTest_Date": datepickar4.text.toString(),
      "Remark_ModelTest": RemarksController.text.toString(),
      "Appointment_Date": datepickar5.text,
      "Appointment_Time": "${selectedTime1.hour}:${selectedTime1.minute}",
      "Remark_Appointment": RemarksController2.text.toString(),
      "Remark_Special": SplRemarks.text.toString(),
      "CurrentAppointmentDate": datepickar5.text,
      "EnquiryStatus": 1,
      "Last_Remark": "jaipur",
      "LastContact_Date": datepickar5.text,
    };
    String jsonString = jsonEncode(postData);
    print(3);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );
      print(4);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Response: $data');
        Get.snackbar(
          'Done',
          ' Api successfully ${response.statusCode}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        print(5);
      } else {
        var data = jsonDecode(response.body);
        print('Failed to post data. Status code: ${response.statusCode}');
        Get.snackbar(
          'Error',
          'Failed to post data. Status code: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(6);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> _fetchRefNo() async {
    setState(() {
      isLoading = true;
    });

    try {
      dynamic data = await autoperfixnumbar();

      if (data is int) {
        setState(() {
          refController.text = data.toString();
          detailsList1.add(data.toString());
        });
      } else if (data is Map<String, dynamic>) {
        String refNo = data['Ref_No'].toString();

        setState(() {
          refController.text = refNo;
          detailsList1.add(refNo);
        });
      } else {
        throw Exception('Unexpected response type');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<dynamic> autoperfixnumbar() async {
    final response = await http.get(
      Uri.parse(
          'http://lms.muepetro.com/api/UserController1/GetInvoiceNo?Tblname=Prospect&Fldname=Ref_No&transdatefld=Ref_Date&varprefixtblname=Prefix_Name&prefixfldnText=%27Online%27&varlocationid=1'),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('HTTP Error: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('Failed to load data');
    }
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        print(
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
        latitude:
        position.latitude;
        longitude:
        position.longitude;
      });
    } catch (e) {
      print(e);
    }
  }
}