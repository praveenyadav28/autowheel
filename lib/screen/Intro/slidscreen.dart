import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:flutter/material.dart';

class SlidScreen extends StatefulWidget {
  int initialIndex = 0;
  SlidScreen({required this.initialIndex, super.key});

  @override
  _SlidScreenState createState() => _SlidScreenState();
}

class _SlidScreenState extends State<SlidScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: widget.initialIndex, length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          Icon(
            Icons.more_vert,
            color: AppColor.kBlack,
          ),
        ],
        leading: BackButton(color: Colors.black),
        toolbarHeight: 39,
        backgroundColor: Colors.white,
        title: Text('Job Cards'),
        bottom: TabBar(
          controller: _tabController,
          labelPadding: EdgeInsets.all(5.0),
          labelStyle: TextStyle(fontSize: 14.0),
          tabs: [
            Tab(
              text: 'Job Card ',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'in Progess',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Spare panding',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Ready ',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Insurance ',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Vehicles ',
              icon: Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("1"),
          Text("2"),
          Text("3"),
          Text("4"),
          Text("5"),
          Text("6"),
        ],
      ),
      floatingActionButton: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xffd2daff)),
        child: Row(
          children: [
            Icon(Icons.add),
            Text(
              "  Job Card",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
