import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenConfig on num {
  // height
  SizedBox get ph => SizedBox(
        height: toDouble().h,
      );
  //width
  SizedBox get pw => SizedBox(
        width: toDouble().w,
      );
}
