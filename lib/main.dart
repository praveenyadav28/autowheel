// ignore_for_file: unused_import, deprecated_member_use

import 'package:autowheelapp/Report/BillReport.dart';
import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/account/livedomo.dart';
import 'package:autowheelapp/labour/Prcheasepart.dart';
import 'package:autowheelapp/routes/Approutes.dart';
import 'package:autowheelapp/screen/Intro/Business1Screen.dart';
import 'package:autowheelapp/screen/Intro/Businesstype3.dart';
import 'package:autowheelapp/screen/Intro/Businestype2.dart';
import 'package:autowheelapp/screen/Intro/Domopage.dart';
import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/Intro/slidscreen.dart';
import 'package:autowheelapp/screen/Intro/SignUp.dart';
import 'package:autowheelapp/screen/Intro/Splash.dart';
import 'package:autowheelapp/screen/Jobcard/Addpart.dart';
import 'package:autowheelapp/screen/Jobcard/Estmitate.dart';
import 'package:autowheelapp/screen/Jobcard/JobCard.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/screen/Jobcard/Materilissu.dart';
import 'package:autowheelapp/screen/Jobcard/Modeldata.dart';
import 'package:autowheelapp/screen/Jobcard/Outsidework.dart';
import 'package:autowheelapp/screen/Jobcard/PurchasOder.dart';
import 'package:autowheelapp/screen/master/Companymaster.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/LocationMaster.dart';
import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/screen/master/Searvicemaster.dart';
import 'package:autowheelapp/screen/master/StaffMaster.dart';
import 'package:autowheelapp/showroom/CompantScreen.dart';
import 'package:autowheelapp/showroom/Datevisedeta.dart';
import 'package:autowheelapp/showroom/FollowUpScreen.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/showroom/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
    ));
    return FutureBuilder(
      future: checkConnectivity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Auto Wheel',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: snapshot.data == ConnectivityResult.none
                ? NoInternetScreen()
                : Splash(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 0.85),
                child: child!,
              );
            },
            getPages: PageRoutes.appRoutes(),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }

  Future<ConnectivityResult> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult;
  }
}

class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    super.initState();
    checkConnectivityAndNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Internet Connection'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Check for internet connectivity
              },
              child: Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }

  void checkConnectivityAndNavigate(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      var status = await Permission.location.request();

      if (status == PermissionStatus.granted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash()),
        );
      } else {
        print('Location permission denied');
      }
    }
  }
}
