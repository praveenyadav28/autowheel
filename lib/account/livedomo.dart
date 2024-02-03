// ignore_for_file: unused_import

import 'package:autowheelapp/models/ModelApi.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class livedomo extends StatefulWidget {
  const livedomo({super.key});

  @override
  State<livedomo> createState() => _livedomoState();
}

var h, w;

// List<Map<String, dynamic>> dealer = [];
List<Map<String, dynamic>> manufacturers = [];
Map<String, dynamic>? selectedManufacturer;
int? selectedRadio;

//  selectedRadio = 1;
class _livedomoState extends State<livedomo> {
  final StdController = TextEditingController();

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;

      if (val == 2) {
        manufutureurData(7);
      } else if (val == 3) {
        manufutureurData(10);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;

    manufutureurData(7);
  }

  @override
  Widget build(BuildContext context) {
    // ... (rest of your build method remains unchanged)

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: AppColor.kWhite,
                  border: Border.all(color: AppColor.kBlack, width: 2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setSelectedRadio(1);
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          selectedManufacturer = null;
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Cash  ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setSelectedRadio(2);
                            },
                            child: Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                selectedManufacturer = null;
                                setSelectedRadio(val);
                              },
                            ),
                          ),
                          Text(
                            'Card  ',
                            style: TextStyle(fontSize: 16),
                          ),

                          Radio(
                            value: 3,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              selectedManufacturer = null;
                              setSelectedRadio(val);
                            },
                          ),

                          // Radio(
                          //   value: 3,
                          //   groupValue: selectedRadio,
                          //   onChanged: (val) {
                          //     setSelectedRadio(val);
                          //   },
                          // ),
                          Text(
                            'Credit',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(10),
              Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColor.kBlack,
                  ),
                  underline: Container(),
                  value: selectedManufacturer,
                  hint: Text(
                    "Select Manufacturer.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.kBlack),
                  ),
                  isExpanded: true,
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> manufutureurData(int ledgerGroupId) async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=$ledgerGroupId');
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


// import 'package:autowheelapp/models/ModelApi.dart';
// import 'package:flutter/material.dart';

// class name extends StatefulWidget {
//   const name({super.key});

//   @override
//   State<name> createState() => _nameState();
// }

// class _nameState extends State<name> {
//   MyModel myModel = MyModel.fromJson({
//     "ItemGroup": 1,
//     "Title": "2",
//     "SaleCertificate": "3",
//     "Unit": "4",
//     "Colour": "5",
//     "VehicleGroup": "6",
//     "LedgerGroup": "7",
//     "LabourGroup": "8",
//     "ServiceType": "9",
//     "Source": "10",
//     "Destination": "11",
//     "Department": "12",
//     "State": "13",
//     "BankMode": "14",
//     "Category": "15",
//     "DealerCategory": "20",
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Text(myModel.colour),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
