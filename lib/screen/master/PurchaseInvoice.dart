// ignore_for_file: unused_import, unused_local_variable, unused_element
import 'package:autowheelapp/labour/Prcheasepart.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PurchaseInvoiceScreen extends StatefulWidget {
  const PurchaseInvoiceScreen({super.key});
  @override
  State<PurchaseInvoiceScreen> createState() => _PurchaseInvoiceScreenState();
}

TextEditingController datepickar = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController Supplerinvocontroller = TextEditingController();
TextEditingController purchesasecontroller = TextEditingController();
var h, w;
String so = "c/o";
List co = ['c/o', 'D/o.', 'W/o.'];
String? relation2;
List _relate2 = [];
List<Map<String, dynamic>> manufacturers = [];
Map<String, dynamic>? selectedManufacturer;
var manufactureValue;

class _PurchaseInvoiceScreenState extends State<PurchaseInvoiceScreen> {
  @override
  void initState() {
    super.initState();
    manufutureurData();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: AppColor.kBlack,
          )
        ],
        centerTitle: true,
        title: Text('Purchease Invoice'),
        toolbarHeight: 35,
        leading: BackButton(color: AppColor.kBlack),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        controller: datepickar,
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
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: datetxt,
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
                              datepickar.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
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
                        labelText: 'Pinv No',
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: textformfiles(Supplerinvocontroller,
                          hintText: "Supplier invoice",
                          labelText: "Supplier invoice")),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: textformfiles(purchesasecontroller,
                          hintText: "place of supply",
                          labelText: "place of supply"))
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
                          "Select Manufacturer.",
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
              InkWell(
                  onTap: () {
                    Get.to(addpartsScreen());
                  },
                  child: Button("Add parts")),
              addVerticalSpace(10),
              Rowdata("gross Amt", "0000"),
              addVerticalSpace(10),
              Rowdata("Other", "0000"),
              addVerticalSpace(10),
              Rowdata("Igst", "0000"),
              addVerticalSpace(10),
              Rowdata("Cgst", "0000"),
              addVerticalSpace(10),
              Rowdata("Sgst", "0000"),
              addVerticalSpace(10),
              Rowdata("Cess", "0000"),
              addVerticalSpace(10),
              Rowdata("Discount", "0000"),
              addVerticalSpace(10),
              Rowdata("net Amt", "0000"),
              addVerticalSpace(10),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.kbuttonclr),
                  child: Center(child: textcostam("Save", 16, AppColor.kWhite)),
                ),
              ),
              addVerticalSpace(15)
            ],
          ),
        ),
      ),
    );
  }

  Row Rowdata(String txt, String txt1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          height: 35,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.kBlack),
            // border: (),
            color: AppColor.kWhite,
            borderRadius: BorderRadius.circular(5),
            // boxShadow: [BoxShadow(blurRadius: 2, color: AppColor.kGray)]
          ),
          child: Center(
            child: Text(
              txt1,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> manufutureurData() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=9');
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
}
