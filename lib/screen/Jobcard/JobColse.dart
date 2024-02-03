// ignore_for_file: unused_local_variable

import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class JobColseScreen extends StatefulWidget {
  const JobColseScreen({super.key});

  @override
  State<JobColseScreen> createState() => _JobColseScreenState();
}

TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);

class _JobColseScreenState extends State<JobColseScreen> {
  late TimeOfDay selectedTime;
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

  String Mgr = "Model Name";
  List Mg = ['Model Name', 'red', 'red', 'green', "ambar", "gray", "yellow"];

  var h, w;
  @override
  void initState() {
    super.initState();
    selectedTime =
        TimeOfDay.now(); // Initialize selectedTime with the current time
  }

  TimeOfDay selectedTime2 = TimeOfDay.now();

  var isshow = false;
  var ischack = false;
  var isgear = false;
  var ishomoper = false;
  var isbrake = false;
  var isall = false;
  var iscool = false;
  var isalldoor = false;
  var isbattry = false;
  var isdashbord = false;
  var iscluth = false;
  var isclutchgear = false;
  var isfree = false;
  var isstrrung = false;
  /////////////

  var isallhouse = false;
  var isany = false;
  var isunderbody = false;
  var isaxle = false;
  var istyre = false;
  var isnoise = false;
  var iswiper = false;
  var iscable = false;
  var isnozzle = false;
  var iscohc = false;
  var ischeack = false;
  var isdemand = false;
  var isac = false;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Job Close"),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: textfild("Job Card No.")),
                  addhorizontalSpace(10),
                  Expanded(
                      child: Container(
                    height: 47,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.kbuttonclr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Get Details",
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.bold),
                    )),
                  ))
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
                            contentPadding: EdgeInsets.all(5),
                            // filled: true,
                            // fillColor: Colors.white,
                            hintText: jobtxt,
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
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          "${selectedTime.format(context)}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              addVerticalSpace(10),
              Container(
                padding: const EdgeInsets.all(8),
                // margin: const EdgeInsets.only(right: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  underline: Container(),
                  value: Mgr,
                  dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                  icon: Icon(Icons.keyboard_arrow_down_outlined,
                      size: h * 0.030, color: AppColor.kBlack),
                  isExpanded: true,
                  items: Mg.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      Mgr = value.toString();
                    });
                  },
                ),
              ),
              addVerticalSpace(10),
              textfild("Vichal No."),
              addVerticalSpace(10),
              textfild("Phone No."),
              addVerticalSpace(10),
              textfild("Customer No."),
              addVerticalSpace(10),
              InkWell(onTap: () {}, child: Button("Chack List Show")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  chackbox(
                      isshow,
                      (e) {
                        setState(() {
                          isshow = !isshow;
                        });
                      },
                      "Engine Oil leavel",
                      ischack,
                      (e) {
                        setState(() {
                          ischack = !ischack;
                        });
                      },
                      "Heading and Indicators"),
                  addVerticalSpace(5),
                  chackbox(
                      isgear,
                      (e) {
                        setState(() {
                          isgear = !isgear;
                        });
                      },
                      "gear Oil leaval",
                      ishomoper,
                      (e) {
                        setState(() {
                          ishomoper = !ishomoper;
                        });
                      },
                      "Hom Operation"),
                  addVerticalSpace(5),
                  chackbox(
                      isbrake,
                      (e) {
                        setState(() {
                          isbrake = !isbrake;
                        });
                      },
                      "Brake fuild leavl",
                      isall,
                      (e) {
                        setState(() {
                          isall = !isall;
                        });
                      },
                      "All door glass"),
                  addVerticalSpace(5),
                  chackbox(
                      iscool,
                      (e) {
                        setState(() {
                          iscool = !iscool;
                        });
                      },
                      "Battry Water leaval",
                      isalldoor,
                      (e) {
                        setState(() {
                          isalldoor = !isalldoor;
                        });
                      },
                      "Door dashbord and "),
                  addVerticalSpace(5),
                  chackbox(
                      isbattry,
                      (e) {
                        setState(() {
                          isbattry = !isbattry;
                        });
                      },
                      "clutch and brake\n Paddle free play",
                      isdashbord,
                      (e) {
                        setState(() {
                          isdashbord = !isdashbord;
                        });
                      },
                      "clutch and \nGear option"),
                  addVerticalSpace(5),
                  chackbox(
                      iscluth,
                      (e) {
                        setState(() {
                          iscluth = !iscluth;
                        });
                      },
                      "Thorottle free play",
                      isclutchgear,
                      (e) {
                        setState(() {
                          isclutchgear = !isclutchgear;
                        });
                      },
                      "Steering and \nsuspension Noise"),
                  addVerticalSpace(5),
                  chackbox(
                      isfree,
                      (e) {
                        setState(() {
                          isfree = !isfree;
                        });
                      },
                      "All house and grommets",
                      isstrrung,
                      (e) {
                        setState(() {
                          isstrrung = !isstrrung;
                        });
                      },
                      "any abnormal\n noise"),
                  addVerticalSpace(5),
                  chackbox(
                      isallhouse,
                      (e) {
                        setState(() {
                          isallhouse = !isallhouse;
                        });
                      },
                      "Underbody nut \nboils and leakage",
                      isany,
                      (e) {
                        setState(() {
                          isany = !isany;
                        });
                      },
                      "Axel Noise"),
                  addVerticalSpace(5),
                  chackbox(
                      isunderbody,
                      (e) {
                        setState(() {
                          isunderbody = !isunderbody;
                        });
                      },
                      "Tyre check(pressure\n and condition)",
                      isaxle,
                      (e) {
                        setState(() {
                          isaxle = !isaxle;
                        });
                      },
                      "Tyre noise"),
                  addVerticalSpace(5),
                  chackbox(
                      istyre,
                      (e) {
                        setState(() {
                          istyre = !istyre;
                        });
                      },
                      "wiper bottle water leaval",
                      isnoise,
                      (e) {
                        setState(() {
                          isnoise = !isnoise;
                        });
                      },
                      "battry and cable \ncondition"),
                  addVerticalSpace(5),
                  chackbox(
                      iswiper,
                      (e) {
                        setState(() {
                          iswiper = !iswiper;
                        });
                      },
                      "wiper bollle water-leaval",
                      iscable,
                      (e) {
                        setState(() {
                          iscable = !iscable;
                        });
                      },
                      "battry and cable \ncondition "),
                  addVerticalSpace(5),
                  chackbox(
                      isnozzle,
                      (e) {
                        setState(() {
                          isnozzle = !isnozzle;
                        });
                      },
                      "wiper spry Nozzle",
                      iscohc,
                      (e) {
                        setState(() {
                          iscohc = !iscohc;
                        });
                      },
                      "COCh(PUC)"),
                  addVerticalSpace(5),
                  chackbox(
                      ischeack,
                      (e) {
                        setState(() {
                          ischeack = !ischeack;
                        });
                      },
                      "Check inturmental \npanal light and dashb",
                      isdemand,
                      (e) {
                        setState(() {
                          isdemand = !isdemand;
                        });
                      },
                      "All demanded \nrepair completed\nasper customer\nrequest"),
                  addVerticalSpace(5),
                  chackbox(
                      isac,
                      (e) {
                        setState(() {
                          isac = !isac;
                        });
                      },
                      "Engine Oil leavel",
                      isdemand,
                      (e) {
                        setState(() {
                          // isdemand = !isdemand;
                        });
                      },
                      "Other"),
                ],
              ),
              addVerticalSpace(10)
              ,
            ],

          ),
        ),
      ),
    );
  }

  
  
  Row chackbox(bool? Fristchack, Function(bool?)? Fristchange, String txt,
      bool? Secandchack, Function(bool?)? Secandchange, String txt2) {
    return Row(
      children: [
        Checkbox(value: Fristchack, onChanged: Fristchange),
        Expanded(child: Text(txt)),
        Checkbox(value: Secandchack, onChanged: Secandchange),
        Expanded(child: Text(txt2)),
      ],
    );
  }

  TextFormField textfild(String? labelText) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onChanged: (value) {},
      decoration: InputDecoration(
        
        counterText: "",
        labelText: labelText,
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(),
      ),
    );
  }

  


}
