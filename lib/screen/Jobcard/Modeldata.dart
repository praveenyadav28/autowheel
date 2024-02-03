// ignore_for_file: body_might_complete_normally_nullable
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';

class Addmodel extends StatefulWidget {
  const Addmodel({super.key});
  @override
  State<Addmodel> createState() => _AddmodelState();
}

String so = "Select Group";
List co = [
  'Select Group',
  'Vehicle',
  'motorcycle',
  'Scooter',
  "Track",
  "Electric Scooter",
  "TaTa"
];
String Manufacturer = "Select Manufacture";
List Manufacturerdata = [
  'Select Manufacture',
  'supp1',
  'yamaha',
  'supplierregistersamState',
  "supplierregisterSameState",
  "pur",
  "TaTa"
];

class _AddmodelState extends State<Addmodel> {
  var h, w;
  var entrycontroller = TextEditingController();
  var Pricepoolcontroller = TextEditingController();
  var saccontroller = TextEditingController();
  bool isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Name"),
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(
                saccontroller,
                validator: (p0) {},
                label: textcostam("Model Name", 15, AppColor.kBlack),
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
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: so,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
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
                      // onTap: () {
                      //   Get.to(AddCustomerflotScreen());
                      // },
                      onTap: () {
                        // Get.to(Addmodel());
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
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: Manufacturer,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: Manufacturerdata.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Manufacturer = value.toString();
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
              InkWell(onTap: () {}, child: Button("Save")),
              addVerticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}
