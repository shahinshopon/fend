import 'package:allwellbuy/const/colors.dart';
import 'package:allwellbuy/routes/route.dart';
import 'package:allwellbuy/styles/style.dart';
import 'package:allwellbuy/widgets/customTextField_widget.dart';
import 'package:allwellbuy/widgets/password_input.dart';
import 'package:allwellbuy/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayScreen extends StatefulWidget {
  PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  TextEditingController _amountController = TextEditingController();

  TextEditingController _userNameController = TextEditingController();

  String dropdownValue = 'Select card';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      child: Text(
                        "Send",
                        style: style32,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 35.sp, color: Colors.white),
                      ),
                    ),
                    
                    Center(
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whitedColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: <String>[
                              'Select card',
                              'Visa',
                              'Paypal',
                              'Payoner'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child:
                                    Text(value, style: style16(Colors.black)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            icon: const Icon(Icons.arrow_downward),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextInputField(
                      controller: _amountController,
                      hint: 'Amount',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _userNameController,
                      hint: 'User Name',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                        onTap: () {},
                        child: const RoundedButton(buttonName: 'Send')),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
