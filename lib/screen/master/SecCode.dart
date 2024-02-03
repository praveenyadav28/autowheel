// ignore_for_file: body_might_complete_normally_nullable
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';

class Spare_Parts_cetegory extends StatefulWidget {
  const Spare_Parts_cetegory({super.key});

  @override
  State<Spare_Parts_cetegory> createState() => _Spare_Parts_cetegoryState();
}

class _Spare_Parts_cetegoryState extends State<Spare_Parts_cetegory> {
  final cetegorycon = TextEditingController();
  var IgstController = TextEditingController();
  var Sgstcontroller = TextEditingController();
  var HsnCodeController = TextEditingController();
  var h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColor.kBlack,
        ),
        centerTitle: true,
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        backgroundColor: AppColor.kappabrcolr,
        elevation: 0,
        title: textcostam(seccodetxt, 18, AppColor.kBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(cetegorycon,
                  validator: (p0) {},
                  label: textcostam(typetxt, 15, AppColor.kBlack),
                  prefixIcon: Icon(Icons.search)),
              addVerticalSpace(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * 0.3,
                    child: textformfiles(IgstController, validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter your entry fees";
                      }
                    }, onChanged: (value) {
                      if (IgstController.text.isNotEmpty) {
                        String poolPrice = (int.parse(IgstController.text) / 2)
                            .toStringAsFixed(2);
                        Sgstcontroller.text = poolPrice;
                        setState(() {});
                      } else {
                        Sgstcontroller.clear();
                        setState(() {});
                      }
                      setState(() {});
                    },
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        label: textcostam("IGST", 14, AppColor.kBlack)),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    width: w * 0.3,
                    child: textformfiles(
                        readOnly: true,
                        Sgstcontroller,
                        validator: (p0) {},
                        label: textcostam("CGST", 14, AppColor.kBlack)),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    width: w * 0.3,
                    child: textformfiles(
                        readOnly: true,
                        Sgstcontroller,
                        validator: (p0) {},
                        label: textcostam("SGST", 14, AppColor.kBlack)),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: textformfiles(
              //         cetegorycon,
              //         validator: (p0) {},
              //         label: textcostam(igsttext, 15, AppColor.kBlack),
              //       ),
              //     ),
              //     addhorizontalSpace(15),
              //     Expanded(
              //       child: textformfiles(
              //         cetegorycon,
              //         validator: (p0) {},
              //         label: textcostam(
              //           sgstxt,
              //           15,
              //           AppColor.kBlack,
              //         ),
              //         // prefixIcon: Icon(Icons.search)
              //       ),
              //     ),
              //     addhorizontalSpace(10),
              //     Expanded(
              //       child: textformfiles(
              //         cetegorycon,
              //         validator: (p0) {},
              //         label: textcostam(cgsttxt, 15, AppColor.kBlack),
              //         // prefixIcon: Icon(Icons.search)
              //       ),
              //     ),
              //   ],
              // ),
              addVerticalSpace(10),
              Button("Save"),
              addVerticalSpace(10),
              redButton(delettxt)
            ],
          ),
        ),
      ),
    );
  }
}
