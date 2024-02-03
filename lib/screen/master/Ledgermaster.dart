// ignore_for_file: unused_import, unused_field, unused_label, body_might_complete_normally_nullable, deprecated_member_use
import 'dart:convert';
import 'dart:io';
import 'package:autowheelapp/models/Staffmodelpage.dart';
import 'package:autowheelapp/screen/Intro/Login_screen.dart';
import 'package:autowheelapp/showroom/VihecalScreen.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class LedgerScreen extends StatefulWidget {
  @override
  _LedgerScreenState createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController _dateController1 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  TextEditingController _dateController2 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  TextEditingController LedgerController = TextEditingController();
  TextEditingController AddressControler = TextEditingController();
  TextEditingController PinController = TextEditingController();
  TextEditingController StdController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController DisticController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController OpenController = TextEditingController();
  TextEditingController GstController = TextEditingController();
  // TextEditingController
  TextEditingController dsistic = TextEditingController();
  TextEditingController sonoff = TextEditingController();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  var LegderID;
  var selectedGstId;
  var genralid;
  var Loctionid;
  var staffid;
  String selectedStaffId = ''; // Variable to store the selected staff ID
  List<String> options = [];
  List<Staffmodel> staffList = [];
  String staffName = "John Doe";
  String relation = "M/s";
  List _relate = ['M/s', 'Mr.', 'Mrs.', "Miss", "Dr."];
  String so = "s/o";
  List co = ['s/o', 'D/o.', 'W/o.'];
  String StaffLedgerScreen = "Select staff";
  List Staff = [
    'Select staff',
    'Mother',
    'Guardian',
  ];
  String cr = "cr";
  List dr = [
    'cr',
    'dr',
    '',
  ];
///// lager group
  String Gstdeller = "Lagder group";
  List gst1 = [
    'Lagder group',
    'Mother',
    'Guardian',
  ];
  ///// lager group
  //////
  String gst = "Select a Group";

  List<Map<String, dynamic>> dealer = [];
//////////
  int selectedId = 0;
  List<Map<String, dynamic>> dealer0 = [];
  int selectedId1 = 0;
  List<Map<String, dynamic>> dealer1 = [];
  var h, w;
  String staffLedgerScreen = "Select staff";
  List<String> staff1 = ['Select staff'];
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  int selectedId0 = 0;
  List<Map<String, dynamic>> dealer2 = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    lagerGroupApi();
    gstCatagry();
    staff();
    catageryId15();
    loction();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  File? imageFile;
  Future<void> getFromGallery() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  File? imageFile2;
  Future<void> getFromGallery2() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back(result: true);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        toolbarHeight: 25,
        backgroundColor: AppColor.kappabrcolr,
        title: Text('Legder master'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Legder'),
            Tab(text: 'Temp address.'),
            Tab(text: 'Docoment'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalSpace(10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 47,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButton(
                                    underline: Container(),
                                    value: relation,
                                    dropdownColor: const Color.fromARGB(
                                        255, 211, 247, 212),
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: h * 0.030,
                                        color: AppColor.kBlack),
                                    isExpanded: true,
                                    items: _relate.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        relation = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: TextFormField(
                                        controller: LedgerController,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "plese enter a Legder Name. ";
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          labelText: "Legder Name",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          contentPadding: EdgeInsets.all(5),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0, color: Colors.red),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 5),
                                          ),
                                        ))),
                              ],
                            ),

                            addVerticalSpace(10),

                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 47,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButton(
                                    underline: Container(),
                                    value: so,
                                    dropdownColor: const Color.fromARGB(
                                        255, 211, 247, 212),
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: h * 0.030,
                                        color: AppColor.kBlack),
                                    isExpanded: true,
                                    items: co.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                Expanded(
                                    child: textformfiles(
                                  sonoff,
                                  hintText: "s/o.",
                                  labelText: "s/o.",
                                )),
                              ],
                            ),
                            addVerticalSpace(10),
                            CSCPicker(
                              showStates: true,
                              showCities: true,
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  )),
                              disabledDropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              dropdownItemStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              dropdownDialogRadius: 10.0,
                              searchBarRadius: 10.0,
                              onCountryChanged: (value) {
                                setState(() {
                                  countrySearchPlaceholder:
                                  "$cityValue";
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
                            addVerticalSpace(10),
                            textformfiles(
                              AddressControler,
                              hintText: "Address",
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                Expanded(
                                  child: textformfiles(PinController,
                                      hintText: "Pin code",
                                      labelText: "Pin code",
                                      keyboardType: TextInputType.number),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: textformfiles(StdController,
                                      hintText: "Std code",
                                      labelText: "Std code",
                                      keyboardType: TextInputType.number),
                                )
                              ],
                            ),

                            addVerticalSpace(10),
                            textformfiles(MobileController,
                                hintText: "Mobile No",
                                labelText: "Mobile No",
                                keyboardType: TextInputType.number),
                            addVerticalSpace(10),
                            textformfiles(EmailController,
                                hintText: "MailId@gmail.com",
                                labelText: "MailId@gmail.com",
                                keyboardType: TextInputType.text),
                            addVerticalSpace(10),
                            textformfiles(DisticController,
                                hintText: "District",
                                labelText: "District",
                                keyboardType: TextInputType.text),

                            addVerticalSpace(10),
//////group

                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: gst,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: dealer.map((value) {
                                  return DropdownMenuItem(
                                    value: value['ledger_Group_Name'],
                                    child: Text(
                                      '${value['id']} -${value['ledger_Group_Name']}',
                                      // value['ledger_Group_Name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  int selectedIndex = dealer.indexWhere(
                                      (item) =>
                                          item['ledger_Group_Name'] == value);
                                  LegderID =
                                      '${dealer[selectedIndex]['id'].toString()}';
                                  debugPrint(LegderID);
                                  gst = value.toString();
                                  setState(() {});
                                },
                              ),
                            ),

//////
                            addVerticalSpace(10),
                            Row(
                              children: [
                                Expanded(
                                  child: textformfiles(OpenController,
                                      hintText: "Opening Bal.",
                                      labelText: "Opening Bal.",
                                      keyboardType: TextInputType.text),
                                  // textfild(
                                  //     'Opening Bal.', TextInputType.number)
                                ),
                                addhorizontalSpace(10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DropdownButton(
                                      underline: Container(),
                                      value: cr,
                                      dropdownColor: const Color.fromARGB(
                                          255, 211, 247, 212),
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: h * 0.030,
                                          color: AppColor.kBlack),
                                      isExpanded: true,
                                      items: dr.map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          cr = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: selectedId,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: dealer0.map((value) {
                                  return DropdownMenuItem(
                                    value: value['id'],
                                    child: Text(
                                      '${value['id']} -${value['name']}',
                                      // value['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedId = value as int;
                                    selectedGstId = value;
                                    print(selectedGstId.toString());
                                  });
                                },
                              ),
                            ),

                            addVerticalSpace(10),
                            textformfiles(GstController,
                                hintText: "Gst no.",
                                labelText: "Gst no.",
                                keyboardType: TextInputType.text),

                            addVerticalSpace(10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
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
                            addVerticalSpace(10),
                            // ***
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: selectedId1,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: dealer1.map((value) {
                                  return DropdownMenuItem(
                                    value: value['id'],
                                    child: Text(
                                      // value['name'],
                                      '${value['id']} -${value['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedId1 = value as int;
                                    genralid = value;
                                    print(genralid.toString());
                                  });
                                },
                              ),
                            ),
                            addVerticalSpace(10),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: selectedId3,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: Colors.black, // AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: Loctionshow.map((value) {
                                  return DropdownMenuItem(
                                    value: value['id'],
                                    child: Text(
                                      '${value['id']} -${value['location_Name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                      readOnly: true,
                                      // textAlignVertical: TextAlignVertical.bottom,
                                      controller: _dateController1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          // filled: true,
                                          // fillColor: Colors.white,
                                          labelText: "From Date",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // suffixIcon: Image.asset("assets/calender.png"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 5.0, color: Colors.red),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 5),
                                          )),
                                      // border: OutlineInputBorder(
                                      //   borderRadius:
                                      //       BorderRadius.circular(5),
                                      // )),
                                      onTap: () async {
                                        // ignore: unused_local_variable
                                        DateTime date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now())
                                            .then((selectedDate) {
                                          if (selectedDate != null) {
                                            _dateController1.text =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate);
                                          }
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                      readOnly: true,
                                      // textAlignVertical: TextAlignVertical.bottom,
                                      controller: _dateController1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          // filled: true,
                                          // fillColor: Colors.white,
                                          // hintText: "WefDate",
                                          labelText: "To Date",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          // suffixIcon: Image.asset("assets/calender.png"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 5.0, color: Colors.red),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 5),
                                          )),
                                      onTap: () async {
                                        // ignore: unused_local_variable
                                        DateTime date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now())
                                            .then((selectedDate) {
                                          if (selectedDate != null) {
                                            _dateController1.text =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate);
                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                            InkWell(
                              onTap: () {
                                postLedgerMaster();
                                // if (_formKey.currentState!.validate()) {
                                //   // validation();
                                // }
                              },
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.kbuttonclr),
                                child: Center(
                                    child: textcostam(
                                        "Save", 16, AppColor.kWhite)),
                              ),
                            ),
                            addVerticalSpace(15),
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.kRed,
                              ),
                              child: Center(
                                  child: textcostam(
                                      "Delete", 16, AppColor.kWhite)),
                            ),

                            addVerticalSpace(10),
                          ]),
                    ),
                  ))),
          // Content for Tab 2
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Temporary address. ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(10),
                    CSCPicker(
                      showStates: true,
                      showCities: true,
                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2)),
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
                        fontSize: 15,
                      ),
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dropdownDialogRadius: 10.0,
                      searchBarRadius: 10.0,
                      onCountryChanged: (value) {
                        setState(() {
                          countrySearchPlaceholder:
                          "$cityValue";
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
                    addVerticalSpace(10),
                    textfild("District", TextInputType.number),
                    addVerticalSpace(10),
                    textfild("Address", TextInputType.text),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        addVerticalSpace(10),
                        Expanded(
                            child: textfild("Pin Code", TextInputType.number)),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: textfild("Std Code", TextInputType.number))
                      ],
                    ),
                    addVerticalSpace(10),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.kbuttonclr),
                        child: Center(
                            child: textcostam("Save", 16, AppColor.kWhite)),
                      ),
                    ),
                    addVerticalSpace(10),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.kRed,
                      ),
                      child: Center(
                          child: textcostam("Delete", 16, AppColor.kWhite)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: ,
                  children: [
                    Center(
                      child: Text(
                        'Docoment.',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    addVerticalSpace(10),
                    textfild("Docoment type", TextInputType.text),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              getFromGallery();
                            },
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: AppColor.kGray,
                                    )
                                  ]),
                              child: Center(child: Text("Uplode")),
                            ),
                          ),
                        ),
                        addhorizontalSpace(10),
                        Expanded(
                          child: Center(
                              child: textfild("Doc1", TextInputType.text)),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              getFromGallery2();
                            },
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: AppColor.kGray,
                                    )
                                  ]),
                              child: Center(child: Text("uplode")),
                            ),
                          ),
                        ),
                        addhorizontalSpace(10),
                        Expanded(
                          child: Center(
                              child: textfild("Doc2", TextInputType.text)),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // margin: EdgeInsets.all(5),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: AppColor.kGray,
                                  )
                                ]),
                            child: Center(child: Text("Uplode")),
                          ),
                        ),
                        addhorizontalSpace(15),
                        Expanded(
                          child: Center(
                              child: textfild("Doc3", TextInputType.text)),
                        ),
                      ],
                    ),
                    addVerticalSpace(20),
                    Row(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: AppColor.kWhite,
                            radius: 50,
                            backgroundImage: imageFile == null
                                ? const AssetImage("assets/gallery-export.png",
                                    package: "")
                                : Image.file(imageFile!).image,
                          ),
                        ),
                        addhorizontalSpace(5),
                        // CircleAvatar(
                        //   backgroundColor: AppColor.kWhite,
                        //   radius: 50,
                        //   backgroundImage: imageFile2 == null
                        //       ? const AssetImage("assets/gallery-export.png",
                        //           package: "")
                        //       : Image.file(imageFile2!).image,
                        // ),
                      ],
                    ),
                    addVerticalSpace(10),
                    InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Button(savetxt)),
                    addVerticalSpace(10),
                    redButton(delettxt)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField textfild(String? labelText, TextInputType? keyboardType) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      // onChanged: (value) {},
      decoration: InputDecoration(
          counterText: "",
          labelText: labelText,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.all(5),
          // border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          )),
    );
  }

  Future<void> lagerGroupApi() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetLedgerGroup');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        setState(() {
          dealer.add({'ledger_Group_Name': 'Select a Group', 'id': 0});
          dealer.addAll(data.cast<Map<String, dynamic>>());
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

  Future<void> gstCatagry() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetGstCategary?MiscTypeId=20');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          dealer0.add({'name': 'Select a GST Catagary', 'id': 0});
          dealer0.addAll(data.cast<Map<String, dynamic>>());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> catageryId15() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetGstCategary?MiscTypeId=15');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          dealer1.add({'name': 'Select a Category', 'id': 0});
          dealer1.addAll(data.cast<Map<String, dynamic>>());
        });
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

  Future<void> postLedgerMaster() async {
    print('1');
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/PostLedgerMaster');
    final Map<String, dynamic> body = {
      "Title_Id": 1,
      "Ledger_Name": LedgerController.text,
      "Son_Off": sonoff.text,
      "Address": AddressControler.text,
      "Address2": "Jaipur",
      "City_Id": 1,
      "Std_Code": StdController.text,
      "Mob": MobileController.text,
      "Pin_Code": PinController.text,
      "Ledger_Group_Id": int.parse(LegderID),
      "Opening_Bal": OpenController.text,
      "Opening_Bal_Combo": "Dr",
      "Gst_No": GstController.text,
      "Address_TA": "Address2_TA",
      "Address2_TA": "",
      "Std_Code_TA": "0151",
      "Mob_TA": "9462653836",
      "Pin_Code_TA": "302012",
      "SubcidyIdNo": " SubcidyIdNo",
      "DueDate": "17/12/2023",
      "ClosingBal": "0",
      "ClosingBal_Type": "cr",
      "Category_Id": genralid,
      "Staff_Id": staffList
          .firstWhere((staff) => staff.staffName == selectedStaffId,
              orElse: () => Staffmodel(id: 0, staffName: ''))
          .id,
      "CreditLimit": "Address2_TA",
      "CreditDays": "",
      "WhatappNo": 122,
      "EmailId": emailController.text,
      "BirthdayDate": "302012",
      "AnniversaryDate": " SubcidyIdNo",
      "DistanceKm": "17/12/2023",
      "DiscountSource": "0",
      "DiscountValid": "Dr",
      "Location_Id": loctionid,
      "OtherNumber1": 1,
      "OtherNumber2": 2,
      "OtherNumber3": 3,
      "OtherNumber4": 4,
      "OtherNumber5": 5,
      "GSTTypeId": selectedGstId,
      "IGST": 28,
      "CGST": 14,
      "SGST": 14,
      "CESS": 1,
      "RCMStatus": 28,
      "ITCStatus": 14,
      "ExpencesTypeId": 14,
      "RCMCategory": 1
    };
    print('2');
    // debugPrint(body.toString());
    // return;
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
          Navigator.pop(context);
        } else {
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
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
      print('7');
    } catch (e) {
      print('Error: $e');
    }
  }
}
