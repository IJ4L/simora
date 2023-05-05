import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/themes.dart';
import 'costume_button.dart';

class Dialoginfo extends StatelessWidget {
  const Dialoginfo({
    super.key,
    required this.title,
    this.pageTo = true,
    this.type = true,
    this.height = 300,
  });

  final String title;
  final bool pageTo;
  final bool type;
  final int height;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: height.r,
        width: 320.r,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SvgPicture.asset(
              "assets/icons/Succes.svg",
              width: 150.r,
              height: 150.r,
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kTextInfoColor,
              ),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Costumebutton(
                title: 'Continue',
                ontap: type
                    ? () {
                        pageTo
                            ? Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/home-mahasiswa',
                                (route) => false,
                              )
                            : Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/scan-card',
                                (route) => false,
                                arguments: {
                                  'type': pageTo,
                                  'bg': 'bg_scan_1.svg',
                                  'card': 'bg_scan_out.svg',
                                  'height': 38.h,
                                  'isDialog': true
                                },
                              );
                      }
                    : () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (route) => false,
                        );
                      },
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
    );
  }
}
