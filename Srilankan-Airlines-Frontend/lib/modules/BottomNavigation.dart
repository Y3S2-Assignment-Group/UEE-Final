import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Util/colors.dart' as color;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class BottomNavigation extends StatefulWidget {

  BottomNavigation({this.selIndex});
  final selIndex;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/bookflight');
        break;
      case 2:
        Navigator.pushNamed(context, '/schedule');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 28,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(0xFF65C4DE),
              color: Color(0xFF65C4DE),
              tabs: [
                GButton(
                  icon: IconData(0xe318, fontFamily: 'MaterialIcons'),
                  text: 'HOME',
                ),
                GButton(
                  icon: IconData(58007, fontFamily: 'MaterialIcons'),
                  text: 'BOOK',
                ),
                GButton(
                  icon: IconData(62265, fontFamily: 'MaterialIcons'),
                  text: 'SCHEDULE',
                ),
                GButton(
                  icon: IconData(57411, fontFamily: 'MaterialIcons'),
                  text: 'PROFILE',
                ),
              ],
              selectedIndex: widget.selIndex,
              onTabChange: (index) {
               _onItemTapped(index);
              },
            ),
          ),
        ),
    );
  }
}
