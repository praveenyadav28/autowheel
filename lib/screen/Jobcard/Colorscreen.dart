// ignore_for_file: body_might_complete_normally_nullable

import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  var entrycontroller = TextEditingController();
  var Pricepoolcontroller = TextEditingController();
  var saccontroller = TextEditingController();
  bool isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Name"),
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
                label: textcostam("Color Name", 15, AppColor.kBlack),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.buttoncolr,
                ),
                child: Center(child: textcostam("Save ", 16, AppColor.kWhite)),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
