import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Util/colors.dart' as color;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 1) {
// When it gets there hold it there.
        _controller.value = 1;
      }
    });
    //set time to load the new page
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.splashScreenBackground,
      body: Container(
        alignment: Alignment.center,
        // child: Expanded(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Lottie.asset('assets/images/splashnew.json',
        //           width: 200, controller: _controller, onLoaded: (comp) {
        //         _controller
        //           ..duration = comp.duration
        //           ..forward();
        //       }),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
