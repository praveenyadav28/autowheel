import 'dart:async';
import 'dart:convert';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/showroom/FollowUpScreen.dart';
import 'package:autowheelapp/showroom/id.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:get/get.dart';
import 'package:autowheelapp/models/Datevisemodel.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:intl/intl.dart';

class Report extends StatefulWidget {
  const Report({
    Key? key,
  }) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<dynamic> dateList = [];

  TextEditingController datepickar1 = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  TextEditingController datepickar2 = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  @override
  void initState() {
    super.initState();
    loction();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.picture_as_pdf, color: AppColor.kBlack),
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('PDF generated successfully'),
                    ),
                  );
                },
              ),
            )
          ],
          centerTitle: true,
          leading: BackButton(
            color: AppColor.kBlack,
          ),
          backgroundColor: AppColor.kGreen,
          title: Text('Schedule Report'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                            labelText: "From Date",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, // Make the text bold
                            ),
                          ),
                          onTap: () async {
                            // ignore: unused_local_variable
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(FocusNode());
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                datepickar1.text = DateFormat('dd-MM-yyyy')
                                    .format(selectedDate);
                              }
                            });
                          },
                        ),
                      ),
                      addhorizontalSpace(10),
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
                           
                            labelText: "To Date",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, 
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
                                datepickar2.text = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  GestureDetector(
                    onTap: () {
                      if (loctionid == null) {
                        Get.snackbar('Error', 'Please select a location.',
                            backgroundColor: AppColor.kGreen);
                      } else {
                        dateViseDeta(
                          dateFrom: datepickar1.text,
                          dateTo: datepickar2.text,
                          locationId: loctionid,
                        );
                      }
                    },
                    child: Button("Get Data"),
                  ),
                  addVerticalSpace(10),
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dateList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onDoubleTap: () {
                            Get.to(FollowUpScreen(
                              refnom: "${dateList[index]?["ref_No"]}",
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              boxShadow: [
                                BoxShadow(blurRadius: 2, color: AppColor.kGray)
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                  'Customer Name: ${dateList[index]?["customer_Name"] ?? 'N/A'}'),
                              subtitle: Text(
                                  'Sales Person: ${dateList[index]?["salesPerson"] ?? 'N/A'}\nproduct: ${dateList[index]?["product"] ?? 'N/A'}\nrefno.: ${dateList[index]?["ref_No"] ?? 'N/A'}\nmobile.: ${dateList[index]?["mob_No"] ?? 'N/A'} '),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> dateViseDeta(
      {required String dateFrom,
      required String dateTo,
      required int locationId}) async {
    try {
      print('1. Start fetchData');

      // Format the dates to 'yyyy-MM-dd' format (consistent with API endpoint)
      final formattedDateFrom = DateFormat('yyyy-MM-dd').format(
        DateFormat('yyyy-MM-dd').parse(dateFrom),
      );
      final formattedDateTo = DateFormat('yyyy-MM-dd').format(
        DateFormat('yyyy-MM-dd').parse(dateTo),
      );

      final response = await http.get(Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetScheduleReport?datefrom=$formattedDateFrom&dateto=$formattedDateTo&locationid=$locationId',
      ));

      print('2. API Response: ${response.body.toString()}');
      if (response.statusCode == 200) {
        print('3. Updating dateList');
        print(response.body.toString());
        setState(() {
          dateList = json.decode(response.body);
        });
        print('4. dateList Updated: $dateList');
      } else {
        print('Failed to load data: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load data. Please try again.'),
          ),
        );
      }
      print('5. End fetchData');
    } catch (error) {
      print('Error: $error');
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' $error'),
        ),
      );
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
