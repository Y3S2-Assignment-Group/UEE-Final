import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class appbar extends StatefulWidget {
  appbar({Key? key}) : super(key: key);

  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                Lottie.asset('assets/images/appbarlottie.json', width: 60),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PopupMenuButton(itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/flights');
                      },
                      child: Row(children: [
                        Icon(Icons.flight),
                        Text('Search Flight')
                      ]),
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/offers');
                      },
                      child: Row(children: [
                        Icon(Icons.airplane_ticket),
                        Text('Offers')
                      ]),
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/feedback');
                      },
                      child: Row(
                          children: [Icon(Icons.feedback), Text('Feedback')]),
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child:
                          Row(children: [Icon(Icons.logout), Text('Logout')]),
                    )),
                  ];
                })
              ],
            )
          ],
        )
      ]),
    );
  }
}
