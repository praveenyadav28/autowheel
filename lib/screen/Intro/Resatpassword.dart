import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import
import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/Intro/Trialversion.dart';
// ignore: unused_import
import 'package:autowheelapp/screen/Intro/autowheel.dart';
import 'package:autowheelapp/utils/image/image.dart';

class ConfirmpasswordScreen extends StatefulWidget {
  final String email;
  const ConfirmpasswordScreen({
    Key? key,
    required this.email,
  }) : super(key: key);
  @override
  State<ConfirmpasswordScreen> createState() => _ConfirmpasswordScreenState();
}

class _ConfirmpasswordScreenState extends State<ConfirmpasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // ignore: unused_element
  _loadPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPassword = prefs.getString('password');
    if (savedPassword != null) {
      setState(() {
        passwordController.text = savedPassword;
      });
    }
  }

  _savePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', passwordController.text);
  }

  bool obscurePassword = true;
  bool visible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 20, top: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(logoimg),
                  ),
                  addVerticalSpace(30),
                  Text(
                    "Set Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  addVerticalSpace(15),
                  Text(
                    "Set a new password for your Autowheel account \n ${widget.email}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(30),
                  textformfiles(
                    confirmPasswordController,
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    obscureText: visible,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        visible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                    ),
                  ),
                  addVerticalSpace(20),
                  textformfiles(
                    passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: obscurePassword,
                    validator: (value) {
                      if (value != confirmPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),

               
                  addVerticalSpace(30),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _savePassword();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trialvarsoin(
                                        email: widget.email,
                                        password: passwordController.text,
                                      )));
                        } else {
                          return null;
                        }
                      },
                      child: Button("Save Details")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





   // textformfiles(
                  //   confirmPasswordController,
                  //   labelText: 'Confirm Password',
                  //   hintText: 'Re-enter your password',
                  //   obscureText: visible,
                  //   validator: (value) {
                  //     validator:
                  //     (value) {
                  //       if (value != confirmPasswordController.text) {
                  //         return 'Passwords do not match';
                  //       }
                  //       return null;
                  //     };
                  //   },
                  //   //   if (value!.isEmpty) {
                  //   //     return 'Please enter a password';
                  //   //   } else if (value.length != 6) {
                  //   //     return 'Phone password must be 6 digits';
                  //   //   }
                  //   //   return null;
                  //   // },
                  //   prefixIcon: Icon(
                  //     Icons.password,
                  //   ),
                  //   suffixIcon: IconButton(
                  //     icon: Icon(
                  //       visible ? Icons.visibility : Icons.visibility_off,
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         visible = !visible;
                  //       });
                  //     },
                  //   ),
                  // ),
                  // addVerticalSpace(20),
                  // textformfiles(
                  //   passwordController,
                  //   labelText: 'Password',
                  //   hintText: 'Enter your password',
                  //   obscureText: obscurePassword,
                  //   validator: (value) {
                  //     validator:
                  //     (value) {
                  //       if (value != confirmPasswordController.text) {
                  //         return 'Passwords do not match';
                  //       }
                  //       return null;
                  //     };

                  //     // if (value != passwordController.text) {
                  //     //   return 'Passwords do not match';
                  //     // }
                  //     // return null;
                  //   },
                  //   prefixIcon: Icon(
                  //     Icons.password,
                  //   ),
                  //   suffixIcon: IconButton(
                  //     icon: Icon(
                  //       obscurePassword
                  //           ? Icons.visibility
                  //           : Icons.visibility_off,
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         obscurePassword = !obscurePassword;
                  //       });
                  //     },
                  //   ),
                  // ),