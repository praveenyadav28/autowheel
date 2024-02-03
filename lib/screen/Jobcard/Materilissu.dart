// ignore_for_file: unused_import, unused_local_variable

import 'package:autowheelapp/screen/Jobcard/Addpart.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MaterialissuScreen extends StatefulWidget {
  const MaterialissuScreen({super.key});

  @override
  State<MaterialissuScreen> createState() => _MaterialissuScreenState();
}

class _MaterialissuScreenState extends State<MaterialissuScreen> {
  // TextEditingController datepickar1 = TextEditingController();
  TextEditingController datepickar1 = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  TextEditingController vicalcontiner = TextEditingController();
  TextEditingController chassisnocontroller = TextEditingController();
  TextEditingController EnginController = TextEditingController();
  TextEditingController Jobcardcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColor.kBlack,
            ),
          )
        ],
        centerTitle: true,
        leading: BackButton(color: AppColor.kBlack),
        backgroundColor: AppColor.kappabrcolr,
        title: Text("Materisl issue"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: datetxt,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await await showDatePicker(
                            context: context,
                            initialDate: DateTime
                                .now(), // Set the initial date to the current date
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar1.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                  // addVerticalSpace(10),
                  addhorizontalSpace(10),
                  Expanded(child: textfild("Mi No.")),
                  addVerticalSpace(10),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: textformfiles(Jobcardcontroler,
                        keyboardType: TextInputType.number,
                        labelText: "Job card No.",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/jobcardnumbar.png',
                            height: 18,
                          ),
                        )),
                  ),
                  addhorizontalSpace(10),
                  Expanded(child: Button("Find"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Job Card Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.kGray,
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              addVerticalSpace(10),
              textformfiles(vicalcontiner,
                  labelText: VehicalNotxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      imgcar,
                      height: 18,
                    ),
                  )),
              addVerticalSpace(10),
              textformfiles(chassisnocontroller,
                  labelText: Chassistxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      chessisimg,
                      height: 18,
                    ),
                  )),
              addVerticalSpace(10),
              textformfiles(EnginController,
                  labelText: Engintxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      enginimg,
                      height: 18,
                    ),
                  )),
            
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    Get.to(addpartsScreen());
                  },
                  child: Button("Issue part ")),
              addVerticalSpace(10),
              Button("Save")
            ],
          ),
        ),
      ),
    );
  }

}
