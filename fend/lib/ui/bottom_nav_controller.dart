
import 'package:allwellbuy/ui/views/activties_screen.dart';
import 'package:allwellbuy/ui/views/home_screen.dart';
import 'package:allwellbuy/ui/views/card_screen.dart';
import 'package:allwellbuy/ui/views/pay_screen.dart';
import 'package:allwellbuy/ui/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _selectedInbox = 0;

  void __navigatorButtonBar(int index) {
    setState(() {
      _selectedInbox = index;
    });
  }

  final List<Widget> _page = [
    const HomeScreen(),
    const CardScreen(),
    PayScreen(),
    const ActvitiesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedInbox],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedInbox,
        onTap: __navigatorButtonBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: 20.sp,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payments_sharp,
              size: 25.sp,
            ),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_alt,
              size: 25.sp,
            ),
            label: "Pay",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_alt,
              size: 25.sp,
            ),
            label: "Activities",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25.sp,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
