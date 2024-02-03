// ignore_for_file: body_might_complete_normally_nullable, must_be_immutable
import 'dart:convert';
import 'package:get/get.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Group1Screen extends StatefulWidget {
  int SourecID;
  Group1Screen({super.key, required this.SourecID});

  @override
  State<Group1Screen> createState() => _Group1ScreenState();
}

class _Group1ScreenState extends State<Group1Screen> {
  var Groupcontroller = TextEditingController();
  bool isSearchMode = false;

  @override
  void initState() {
    super.initState();
    // postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Group"),
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,
        leading: IconButton(
            onPressed: () {
              
              Navigator.pop(context, "refeash");
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(Groupcontroller,
                  validator: (p0) {},
                  label: textcostam(Group, 15, AppColor.kBlack),
                  prefixIcon: Icon(
                    Icons.code,
                    color: AppColor.kGray,
                  )),
              addVerticalSpace(30),
              InkWell(
                  onTap: () {
                    postData();
                  },
                  child: Button(savetxt)),

              // redButton(delettxt)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postData() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/PostMiscMaster');
    final data = {
      "Name": Groupcontroller.text,
      "LocationId": 12,
      "MiscMasterId": widget.SourecID,
    };
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['result'] == true) {
          Get.snackbar("Success", "Details saved successfully",
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
          Navigator.pop(context);
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => PartsMasters()));
        } else if (responseData['message'] == "Name already exists") {
          Get.snackbar(
              "Error", "Name already exists. Please use a different name.",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "An error occurred while saving the details",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
