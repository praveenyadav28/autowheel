// ignore_for_file: camel_case_types, unused_import, body_might_complete_normally_nullable, duplicate_ignore, unnecessary_import

import 'package:autowheelapp/screen/master/SecCode.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearvicemasterScreen extends StatefulWidget {
  const SearvicemasterScreen({super.key});

  @override
  State<SearvicemasterScreen> createState() => _SearvicemasterScreenState();
}

class _SearvicemasterScreenState extends State<SearvicemasterScreen> {
  var servicenamecon = TextEditingController();
  var servicecodecon = TextEditingController();
  var ratecon = TextEditingController();
  var igst = TextEditingController();
  var cgst = TextEditingController();
  var sgst = TextEditingController();

  bool _switchValue = true;

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('service_name', servicenamecon.text);
    prefs.setString('service_code', servicecodecon.text);
    prefs.setDouble('rate', double.parse(ratecon.text));
    prefs.setBool('is_inclusive', _switchValue);
    prefs.setString('igst', igst.text);
    prefs.setString('cgst', cgst.text);
    prefs.setString('sgst', sgst.text);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 36,
          backgroundColor: AppColor.kappabrcolr,
          centerTitle: true,

          title: textcostam(
            "Create Service",
            18,
            AppColor.kBlack,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addVerticalSpace(10),
                  textformfiles(servicenamecon, validator: (e) {
                    if (e!.isEmpty) {
                      return "Please enter is a service name";
                    }
                  }, label: textcostam("Service Name*", 16, AppColor.kBlack)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: textformfiles(servicecodecon, validator: (e) {
                          if (e!.isEmpty) {
                            return "Please enter is a service code";
                          }
                        },
                            keyboardType: TextInputType.number,
                            label: textcostam(
                                "Service code*", 16, AppColor.kBlack)),
                      ),
                      // SizedBox(
                      //   width: 70,
                      // ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.amber,
                        backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-vector/car-service-abstract-concept-illustration_335657-1842.jpg?size=626&ext=jpg&ga=GA1.2.972962653.1692784531&semt=ais"),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: textformfiles(
                          ratecon,
                          validator: (e) {},
                          keyboardType: TextInputType.number,
                          label: textcostam(mrptxt, 16, AppColor.kBlack),
                        ),
                      ),
                      textcostam(Inclusivetxt, 12, AppColor.kBlack),
                      addhorizontalSpace(8),
                      CupertinoSwitch(
                        value: _switchValue,
                        activeColor: AppColor.kBlue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 48,
                          width: 150,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColor.kBlack, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              addhorizontalSpace(5),
                              Icon(
                                Icons.code,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.to(Spare_Parts_cetegory());
                                  },
                                  child: textcostam(
                                      seccodetxt, 15, AppColor.kBlack))
                            ],
                          ),
                        ),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                          child: textformfiles(igst,
                              labelText: "Igst", readOnly: true)),
                      addhorizontalSpace(5),
                      Expanded(
                          child: textformfiles(cgst,
                              labelText: "Cgst", readOnly: true)),
                      addhorizontalSpace(5),
                      Expanded(
                          child: textformfiles(sgst,
                              labelText: "Sgst", readOnly: true))
                    ],
                  ),
                  addVerticalSpace(10),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          saveData();
                        }
                      },
                      child: Button(savetxt)),
                  addVerticalSpace(10),
                  InkWell(onTap: () {}, child: redButton(delettxt)),
                ],
              ),
            ),
          ),
        ));
  }
}
