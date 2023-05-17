import 'package:allwellbuy/widgets/card_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/colors.dart';
import '../../styles/style.dart';
import '../../widgets/transation_widget.dart';

class ActvitiesScreen extends StatelessWidget {
  const ActvitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: AppColors.whitedColor,
        title: Text(
          "Dashborad",
          style: style32,
        ),
        actions: [
          Center(
            child: badges.Badge(
             // badgeColor: AppColors.iconColor,
              badgeContent: Text(
                "12",
                style: TextStyle(color: AppColors.whitedColor),
              ),
              child: const CircleAvatar(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 240, 239, 239),
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Icon(FontAwesomeIcons.figma, color: AppColors.iconColor, size: 30),
          SizedBox(width: 20.w),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome,", style: style14to),
                    Text(
                      "Samuel Flecher",
                      style: style28,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 0.1.h,
                width: double.infinity,
                color: AppColors.greydColor,
              ),
              SizedBox(height: 20.h),
              CardWidget(),
              const TransationsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
