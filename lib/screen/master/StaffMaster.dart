// ignore_for_file: unused_import, unused_label, unused_element, body_might_complete_normally_nullable, unnecessary_null_comparison, duplicate_ignore

import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/screen/master/Staffmaster2.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class Staff_master extends StatefulWidget {
  const Staff_master({super.key});
  @override
  State<Staff_master> createState() => _Staff_masterState();
}
String countryValue = "";
String stateValue = "";
String cityValue = "";
String address = "";
String relation = "M/s";
List _relate = ['M/s', 'Mr.', 'Mrs.', "Miss", "Dr."];
String city = "State";
List City = [
  "State",
];

String show_room = "Location";
List _showroom = ["Location"];
// Api title
List<Map<String, dynamic>> title = [
  {'id': 0, 'name': 'title'}
];
String selectedtitleName = "title";
int? selectedtitleId;
// Api Department
List<Map<String, dynamic>> Department = [
  {'id': 0, 'name': 'Department'}
];
String selectedDepartmentName = "Department";
int? selectedDepartmentId;
// Api staff
List<Map<String, dynamic>> StaffDesignattion = [
  {'id': 0, 'name': 'StaffDesignattion'}
];
String selectedStaffDesignattionName = "StaffDesignattion";
int? selectedStaffDesignattionId;
// Api
var loctionid;
List<Map<String, dynamic>> Loctionshow = [];
int selectedId3 = 0;

FocusNode Sofouse = FocusNode();
FocusNode use = FocusNode();
FocusNode billNoFocus = FocusNode();

class _Staff_masterState extends State<Staff_master> {
  var titlecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  var s_ocontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var districcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var stdcodecontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  var Statecontroller = TextEditingController();
  var pincontroller = TextEditingController();
  var h, w;
  bool isSearchMode = false;
  bool index = true;

  final formkey = GlobalKey<FormState>();
  refreshData() async {
    titleDeta();
    departmentDeta();
    staffDesignattiontDeta();
    // await
  }

  @override
  void initState() {
    super.initState();
    titleDeta();
    departmentDeta();
    staffDesignattiontDeta();
    loction();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: AppColor.kBlack),
            toolbarHeight: 36,
            centerTitle: true,
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 82, 198, 86),
            title: textcostam("Staff Master", 22, AppColor.kBlack),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contect) => const Staff_master2()));
                  },
                  child: const Icon(
                    Icons.search,
                    color: AppColor.kBlack,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
                right: w * 0.03, left: w * 0.03, bottom: h * 0.03),
            child: ListView(
              // ignore: prefer_const_constructors
              physics: BouncingScrollPhysics(),
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: h * 0.01,
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                              });
                            },
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      Expanded(
                          child: TextFormField(
                        onFieldSubmitted: (Value) {
                          if (Sofouse != null) {
                            FocusScope.of(context).requestFocus(Sofouse);
                          }
                        },
                        focusNode: Sofouse,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "plese enter a staff name.";
                          }
                        },
                        keyboardType: TextInputType.text,
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
                            prefixIcon: Icon(Icons.person),
                            labelText: "Staff Name*",
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder()),
                      )),
                    ],
                  ),
                  addVerticalSpace(10),
                  textformfiles(s_ocontroller,
                      validator: (value) {
                        return null;
                      },
                      label: textcostam("S/O", 16, AppColor.kBlack),
                      focusNode: use,
                      onFieldSubmitted: (Value) {
                        if (Sofouse != null) {
                          FocusScope.of(context).requestFocus(Sofouse);
                        }
                      }),
                  addVerticalSpace(10),
                  textformfiles(
                    addresscontroller,
                    validator: (value) {
                      return null;
                    },
                    label: textcostam("Phone Number", 16, AppColor.kBlack),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    prefixIcon: Icon(
                      Icons.phone,

                      size: h * 0.024,
                      // Color.fromARGB(255, 36, 137, 39),
                    ),
                  ),
                  addVerticalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            fontWeight: FontWeight.bold),
                        dropdownHeadingStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        dropdownItemStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.46,
                        child: textformfiles(pincontroller, validator: (value) {
                          return null;
                        },
                            label: textcostam("Pin Code", 16, AppColor.kBlack),
                            keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      SizedBox(
                          width: w * 0.442,
                          child: textformfiles(stdcodecontroller,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                            return null;
                          },
                              label:
                                  textcostam("STD Code", 16, AppColor.kBlack)))
                    ],
                  ),
                  addVerticalSpace(10),
                  textformfiles(mobilecontroller, validator: (value) {
                    return null;
                  },
                      label: textcostam("Address", 16, AppColor.kBlack),
                      prefixIcon: Icon(
                        Icons.home,
                        size: h * 0.024,
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
                            value: selectedDepartmentName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: Department.map((item) {
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
                                selectedDepartmentName = value.toString();
                                selectedDepartmentId = Department.firstWhere(
                                            (item) => item['name'] == value)
                                        .containsKey('id')
                                    ? Department.firstWhere(
                                        (item) => item['name'] == value)['id']
                                    : null;
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
                            Get.to(() => Group1Screen(SourecID: 27))!
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
                            value: selectedStaffDesignattionName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: StaffDesignattion.map((item) {
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
                                selectedStaffDesignattionName =
                                    value.toString();
                                selectedStaffDesignattionId =
                                    StaffDesignattion.firstWhere(
                                                (item) => item['name'] == value)
                                            .containsKey('id')
                                        ? StaffDesignattion.firstWhere((item) =>
                                            item['name'] == value)['id']
                                        : null;
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
                            Get.to(() => Group1Screen(SourecID: 28))
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
                              selectedId3; 
                        });
                      },
                    ),
                  ),
           
                  addVerticalSpace(10),
                  InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {}

                        //
                      },
                      child: Button(savetxt)),
                ]),
              ],
            ),
          )),
    );
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

  Future<void> departmentDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=27');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Department.clear();
        Department.add({'id': 0, 'name': 'Department'});
        for (var item in goruppartmodelList) {
          Department.add({'id': item.id, 'name': item.name});
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

  Future<void> staffDesignattiontDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=28');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        StaffDesignattion.clear();
        StaffDesignattion.add({'id': 0, 'name': 'StaffDesignattion'});
        for (var item in goruppartmodelList) {
          StaffDesignattion.add({'id': item.id, 'name': item.name});
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
}
