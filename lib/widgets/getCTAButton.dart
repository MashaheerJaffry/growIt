import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';
// import 'package:skoop/constant.dart';

getCtaButton(
    {@required var text, required VoidCallback onPress, required Color color}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 50.h,
      width: 284.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: kButtonStyle,
          ),
        ],
      ),
    ),
  );
}
