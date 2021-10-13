import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:srilankan_airline/model/user_model.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/provider/user_provider.dart';
import 'package:srilankan_airline/widgets/appbar.dart';
import '../../Util/colors.dart' as color;
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<User?> user;

  @override
  void initState() {
    super.initState();
    user = context.read<UserProvider>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<User?>(
          future: user,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                  height: size.height,
                  child: Center(
                    child: Lottie.asset('assets/images/appbarlottie.json',
                        width: 80),
                  ));
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  appbar(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              NetworkImage(snapshot.data!.profileImg))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Text(snapshot.data!.name,
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFF969696)))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Email address",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Text(snapshot.data!.email,
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFF969696)))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Mobile number",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Text(snapshot.data!.mobileNumber,
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFF969696)))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Passport number",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Text(snapshot.data!.passportNumber,
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFF969696)))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Material(
                                  elevation: 2,
                                  color: color.AppColor.buttonColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: MaterialButton(
                                    onPressed: () {
                                      context
                                          .read<UserProvider>()
                                          .setCustomerName(snapshot.data!.name);
                                      Navigator.pushNamed(context, '/mytrips');
                                    },
                                    minWidth: 200.0,
                                    height: 45.0,
                                    child: Text(
                                      "My Trips",
                                      style: TextStyle(
                                          color: color.AppColor.buttonTextColor,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(selIndex: 3),
    );
  }
}
