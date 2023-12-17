import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../widgets/reusable_widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isVisible = true;
  bool isDateSelect = false;
  bool isDistrictOpen = false;
  bool isBlockOpen = false;
  bool isChecked = false;
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: customContainerGradientStyle(),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap( 30.0.h),
                    inputTextField('First Name'),
                    Gap( 20.0.h),
                    inputTextField('Last Name'),
                    Gap( 20.0.h),
                    //dob field
                    dobInputField(!isDateSelect?'Date of Birth':formattedDate,selectedDate,() => _selectDate(context)),
                    Gap( 20.0.h),
                    // inputTextField('District'),
                    inputDropdownField('District',isDistrictOpen,() {
                      setState(() {
                        isDistrictOpen = !isDistrictOpen;
                      });
                    }),
                    Gap( 20.0.h),
                    inputDropdownField('Block',isBlockOpen,() {
                      setState(() {
                        isBlockOpen = !isBlockOpen;
                      });
                    }),
                    Gap( 20.0.h),
                    inputTextField('Phone'),
                    Gap( 20.0.h),
                    //emailInputFields('Email',),
                    Gap( 20.0.h),
                    // passwordInputFields('Password', isVisible, () {
                    //   setState(() {
                    //     isVisible = !isVisible;
                    //   });
                    // }),
                    Gap( 10.0.h),
                    checkAgreement('Agree to the Terms and policy',isChecked,() => setState(() {
                      isChecked = !isChecked;
                    }),),
                    Gap( 10.0.h),
                    customButton('Register',() {},true),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        // selectedDate = DateFormat.yM('en_US').parse(picked.toString());
        selectedDate = picked;
        isDateSelect = true;
        formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }else{
      isDateSelect = false;
    }
  }
  
}
