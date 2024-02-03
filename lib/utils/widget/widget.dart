// ignore_for_file: duplicate_import
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

TextFormField textformfiles(
  TextEditingController? controller, {
  String? hintText,
  Widget? label,
  TextInputType? keyboardType,
  int? maxLength,
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? Function(String?)? validator,
  Function(String)? onChanged,
  Function(String)? onFieldSubmitted,
  String? labelText,
  TextCapitalization textCapitalization = TextCapitalization.none,
  FocusNode? focusNode,
  bool autofocus = false,
  bool readOnly = false,
  bool obscureText = false,
}) {
  return TextFormField(
    obscureText: obscureText,
    onFieldSubmitted: onFieldSubmitted,
    textCapitalization: TextCapitalization.words,
    keyboardType: keyboardType,
    controller: controller,
    autofocus: autofocus,
    readOnly: readOnly,
    maxLength: maxLength,
    validator: validator,
    onChanged: onChanged,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      labelText: labelText,
      counterText: "",
      prefixIcon: prefixIcon,
      label: label,
      hintStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      hintText: hintText,
      isDense: true,
      contentPadding: const EdgeInsets.only(top: 28, left: 15, right: 10),
      border: InputBorder.none,
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black, width: 2)),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.black),
      ),
    ),
  );
}

Text textcostam(
  String data,
  double? fontSize,
  Color? color,
) {
  return Text(
    data,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addhorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

class trttrtrt extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User cancelled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error during Google Sign-In: $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Sign-In Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              User? user = await _handleSignIn();
              if (user != null) {
                // User signed in successfully
                print('User signed in: ${user.displayName}');
              } else {
                // Handle sign-in error
              }
            },
            child: Text('Sign in with Google'),
          ),
        ),
      ),
    );
  }
}

Widget Button(String txt) {
  return Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: AppColor.kbuttonclr),
    child: Center(child: textcostam(txt, 16, AppColor.kWhite)),
  );
}

Widget redButton(String txt) {
  return Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: AppColor.kRed),
    child: Center(child: textcostam(txt, 16, AppColor.kWhite)),
  );
}

TextFormField textfild(String? labelText) {
  return TextFormField(
    // keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    onChanged: (value) {},
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.red),
      ),
      counterText: "",
      labelText: labelText,
      contentPadding: EdgeInsets.all(5),
      border: OutlineInputBorder(),
    ),
  );
}
////

class StaticData {
  BuildContext context;
  StaticData(this.context);

  void showLoader() {
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.38),
      content:
          //  Row(children: [
          const SizedBox(
        height: 30.0,
        width: 30.0,
        child: Center(child: CircularProgressIndicator(strokeWidth: 3.0)),
      ),
      // Container(
      //     margin: const EdgeInsets.only(left: 15),
      //     child: const Text("Loading...")),
      // ]),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void stopLoader() {
    // ignore: unnecessary_null_comparison
    if (context != null) {
      if (ModalRoute.of(context)?.isCurrent != true) {
        Navigator.of(context).pop();
      }
    }
  }
}
