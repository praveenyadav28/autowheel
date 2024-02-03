// ignore_for_file: body_might_complete_normally_nullable

import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';

import 'package:flutter/material.dart';
class GrouipmanufauctureScrren extends StatefulWidget {
  const GrouipmanufauctureScrren({super.key});

  @override
  State<GrouipmanufauctureScrren> createState() =>
      _GrouipmanufauctureScrrenState();
}

class _GrouipmanufauctureScrrenState extends State<GrouipmanufauctureScrren> {
  var entrycontroller = TextEditingController();
  var Pricepoolcontroller = TextEditingController();
  var saccontroller = TextEditingController();
  bool isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,
       
        title: isSearchMode
            ? TextFormField(
                // Add text form field properties here
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Manufacturertxt,
                    style: TextStyle(color: AppColor.kBlack, fontSize: 18),
                  ),
                ],
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(saccontroller,
                  validator: (p0) {},
                  label: textcostam(Manufacturertxt, 15, AppColor.kBlack),
                  prefixIcon: Icon(
                    Icons.code,
                    color: AppColor.kGray,
                  )),
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
                child: Center(child: textcostam(save, 16, AppColor.kWhite)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.kRed,
                ),
                child: Center(child: textcostam(delettxt, 16, AppColor.kWhite)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
