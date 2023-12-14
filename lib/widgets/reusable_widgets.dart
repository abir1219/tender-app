import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget emailInputFields(String hint,){
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: hint,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget inputDropdownField(String hint,bool isOpen,void Function() func){
  return GestureDetector(
    onTap: () {
      debugPrint("Click-->$isOpen");
      func();
    },
    child: Container(
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.1),
          border: Border.all(
              color: Colors.white
          )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 2),
                child: Text(hint,style: TextStyle(fontSize: 14.sp,color: Colors.white))),
            Icon(!isOpen?Icons.arrow_drop_down_sharp:Icons.arrow_drop_up_sharp,color: Colors.white,size: 24.sp,)
          ],
        ),
      ),
    ),
  );
}

Widget inputTextField(String hint){
  return TextFormField(
    decoration: InputDecoration(
      labelText: hint,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0.h),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0.h),
      ),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget passwordInputFields(String hint,bool isVisible,void Function() func){
  return TextFormField(
    obscureText: isVisible,
    decoration: InputDecoration(
      labelText: hint,
      suffixIcon: IconButton(
        icon: Icon(isVisible?Icons.visibility:Icons.visibility_off,color: Colors.white,),
        onPressed: () => func(),
      ),
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget customButton(String buttonName,void Function() func){
  return ElevatedButton(
    onPressed: () => func(),
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white
    ),
    child: Text(buttonName,style: TextStyle(fontSize: 14.sp,color: Colors.black),),
  );
}

Widget dobInputField(String hint,var selectedDate,void Function() func){
  debugPrint("--selectedDate--$selectedDate");
  return GestureDetector(
    onTap: () {
      debugPrint("Click");
      func();
    },
    child: Container(
      height:60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(
          color: Colors.white
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hint,style: TextStyle(fontSize: 14.sp,color: Colors.white)),
            Icon(Icons.date_range,color: Colors.white,size: 24.sp,)
          ],
        ),
      ),
    ),
  );
}

Gradient customContainerGradientStyle(){
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.blueAccent, Colors.indigo],
  );
}

Widget checkAgreement(String text,bool isChecked,void Function() func){
  return GestureDetector(
    onTap: () {
      debugPrint("Check clicked");
      func();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(2.0),
          // ),
          side: MaterialStateBorderSide.resolveWith(
                (states) =>const BorderSide(width: 1.0, color: Colors.white),
          ),
          activeColor: Colors.blueAccent,
          fillColor: MaterialStateProperty.all(
            Colors.blueAccent,
          ),
          checkColor: Colors.white,
          overlayColor: MaterialStateProperty.all(
            Colors.blueAccent,
          ),
          value: isChecked, onChanged: (value) {func();},),
        Text(text,style: TextStyle(color: Colors.white,fontSize: 12.sp),)
      ],
    ),
  );
}

