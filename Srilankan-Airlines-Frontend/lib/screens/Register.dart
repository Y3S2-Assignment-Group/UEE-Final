import 'package:flutter/material.dart';
import 'package:srilankan_airline/screens/Login/Login.dart';

import '../Util/colors.dart' as color;

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final userName = TextEditingController();
  final email = TextEditingController();
  final passportNumber = TextEditingController();
  final mobileNumber = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We warmly welcome you to Sri Lankan Airlines",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      controller: userName,
                      decoration: InputDecoration(
                          focusColor: color.AppColor.textFieldFocusColor,
                          labelText: "UserName",
                          prefixIcon: Icon(Icons.person),
                          hintStyle: TextStyle(
                              color: color.AppColor.textFieldHintColor),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      controller: email,
                      decoration: InputDecoration(
                          focusColor: color.AppColor.textFieldFocusColor,
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          hintStyle: TextStyle(
                              color: color.AppColor.textFieldHintColor),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      controller: passportNumber,
                      decoration: InputDecoration(
                          focusColor: color.AppColor.textFieldFocusColor,
                          labelText: "Passport Number",
                          prefixIcon: Icon(Icons.book),
                          hintStyle: TextStyle(
                              color: color.AppColor.textFieldHintColor),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      controller: mobileNumber,
                      decoration: InputDecoration(
                          focusColor: color.AppColor.textFieldFocusColor,
                          labelText: "Mobile Number",
                          prefixIcon: Icon(Icons.phone),
                          hintStyle: TextStyle(
                              color: color.AppColor.textFieldHintColor),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      controller: password,
                      decoration: InputDecoration(
                          focusColor: color.AppColor.textFieldFocusColor,
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password),
                          hintStyle: TextStyle(
                              color: color.AppColor.textFieldHintColor),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Material(
                        elevation: 2,
                        color: color.AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(12.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                          minWidth: 200.0,
                          height: 45.0,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: color.AppColor.buttonTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
