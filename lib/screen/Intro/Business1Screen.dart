import 'package:autowheelapp/screen/Intro/Businestype2.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';

import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Business1Screen extends StatefulWidget {
  @override
  _Business1ScreenState createState() => _Business1ScreenState();
}

class _Business1ScreenState extends State<Business1Screen> {
  String singleoutlate1 = "Single Outlet";
  List<String> outlate1 = ['Single Outlet', 'Multi-Outlet'];
  String selectedVehicleType = 'Car';
  List<String> selectedFeatures = [];

  Map<String, List<String>> vehicleFeatures = {
    'Car': ['Leather Seats', 'Sunroof', 'Navigation System'],
    'Heavy Vehicles': ['WiFi', 'Large Seating Capacity', 'Air Conditioning'],
    'Bike': ['Helmet', 'Gloves', 'Bike Lock'],
    'Tractor': ['Helmet', 'Gloves', 'Bike Lock'],
    'Electric Vehicles': ['Helmet', 'Gloves', 'Bike Lock'],
    'Machine': ['Helmet', 'Gloves', 'Bike Lock'],
  };

  var h, w;
  TextEditingController abc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColor.kBlack),
        title: Text(
          'Business Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              addVerticalSpace(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color
                    width: 1.0, // Set the border width
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                ),
                child: DropdownButton<String>(
                  isDense: true,
                  underline: Container(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: h * 0.030,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  value: selectedVehicleType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedVehicleType = newValue!;
                      selectedFeatures = [];
                    });
                  },
                  items: [
                    'Car',
                    'Heavy Vehicles',
                    'Bike',
                    'Tractor',
                    'Electric Vehicles',
                    'Machine'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                children: vehicleFeatures[selectedVehicleType]!
                    .map(
                      (feature) => ChoiceChip(
                        label: Text(feature),
                        selected: selectedFeatures.contains(feature),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedFeatures.add(feature);
                            } else {
                              selectedFeatures.remove(feature);
                            }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20),
              Text('Selected Features: ${selectedFeatures.join(', ')}'),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 57,
                    width: 100,
                    child: DropdownButtonFormField(
                      value: singleoutlate1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select a Model',
                          labelText: 'Select a Model',
                          contentPadding: EdgeInsets.all(5)),
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: h * 0.030,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: outlate1.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          singleoutlate1 = value.toString();
                        });
                      },
                    ),
                  )),
                  addhorizontalSpace(5),
                  SizedBox(
                      height: 57,
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Outlets",
                            labelText: "Outlets",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5)),
                      ))
                ],
              ),
              addVerticalSpace(40),
              InkWell(
                onTap: () {
                  Get.to(BusinessType2());
                },
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.kbuttonclr,
                  ),
                  child: Center(
                      child: Text(
                    "Save Details",
                    style: TextStyle(color: AppColor.kWhite, fontSize: 22),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
