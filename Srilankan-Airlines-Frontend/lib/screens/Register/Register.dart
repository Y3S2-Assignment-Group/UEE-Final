import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:srilankan_airline/provider/customer_provider.dart';
import 'package:srilankan_airline/screens/Login/Login.dart';
import '../../Util/colors.dart' as color;

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final userNameText = TextEditingController();
  final emailText = TextEditingController();
  final passportNumberText = TextEditingController();
  final mobileNumberText = TextEditingController();
  final passwordText = TextEditingController();

  void submit() {
    if (context.read<CustomerProvider>().getName() != '' &&
        context.read<CustomerProvider>().getEmail() != '' &&
        context.read<CustomerProvider>().getMobileNumber() != '' &&
        context.read<CustomerProvider>().getPassportNumber() != '' &&
        context.read<CustomerProvider>().getPassword() != '') {
      context.read<CustomerProvider>().register(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    if (context.read<CustomerProvider>().getToken() != "") {
      Navigator.pushNamed(context, 'home');
    }

    context.read<CustomerProvider>().setName('');
    context.read<CustomerProvider>().setEmail('');
    context.read<CustomerProvider>().setMobileNumber('');
    context.read<CustomerProvider>().setPassportNumber('');
    context.read<CustomerProvider>().setPasswor('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Register",
            style: TextStyle(
              color: color.AppColor.textTitleColor,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: color.AppColor.loginPageBackground,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      controller: userNameText,
                      // initialValue: context.read<CustomerProvider>().getName(),
                      onChanged: (ch) {
                        context.read<CustomerProvider>().setName(ch);
                      },
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
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      controller: emailText,
                      // initialValue: context.read<CustomerProvider>().getEmail(),
                      onChanged: (ch) {
                        context.read<CustomerProvider>().setEmail(ch);
                      },
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
                      controller: passportNumberText,
                      // initialValue:
                      //     context.read<CustomerProvider>().getPassportNumber(),
                      onChanged: (ch) {
                        context.read<CustomerProvider>().setPassportNumber(ch);
                      },
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
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      controller: mobileNumberText,
                      // initialValue:
                      //     context.read<CustomerProvider>().getMobileNumber(),
                      onChanged: (ch) {
                        context.read<CustomerProvider>().setMobileNumber(ch);
                      },
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
                      obscureText: true,
                      validator: (val) {
                        if (val == '') {
                          return 'Please enter password';
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.left,
                      controller: passwordText,
                      onChanged: (ch) {
                        context.read<CustomerProvider>().setPasswor(ch);
                      },
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
                          onPressed: submit,
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
