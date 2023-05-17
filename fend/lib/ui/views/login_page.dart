import 'package:allwellbuy/business_logic/auth.dart';
import 'package:allwellbuy/const/colors.dart';
import 'package:allwellbuy/routes/route.dart';
import 'package:allwellbuy/styles/style.dart';
import 'package:allwellbuy/widgets/customTextField_widget.dart';
import 'package:allwellbuy/widgets/password_input.dart';
import 'package:allwellbuy/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/slider1.png",
                    height: 380.h,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.login2Color,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 35.sp, color: Colors.white),
                          ),
                        ),
                        TextInputField(
                          controller: _emailController,
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        ),
                        PasswordInput(
                          controller: _passController,
                          hint: 'Password',
                          inputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                            onTap: () {
                              Auth().login(_emailController.text, _passController.text, context);
                              // Navigator.of(context)
                              //     .pushNamed(RouteManager.buttonNviBar);
                            },
                            child: const RoundedButton(buttonName: 'Login')),
                       
                       
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
