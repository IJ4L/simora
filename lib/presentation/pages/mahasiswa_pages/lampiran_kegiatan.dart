import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/themes.dart';

class LampiranKegiatan extends StatelessWidget {
  const LampiranKegiatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgorund.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 40.h,
                      width: 180.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 56.h),
                    Text(
                      'MONITORING',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 46.sp,
                      ),
                      textScaleFactor: 1,
                    ),
                    Text(
                      'PRAKTEK PENGENALAN LAPANGAN',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: light,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 48.h),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 304.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.r),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 170.h,
            left: 10.w,
            right: 10.w,
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/pdf_mhs.svg'),
                const SizedBox(height: 30.0),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8.w),
                      child: SizedBox(
                        height: 44.h,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/cloud_download.svg',
                                // ignore: deprecated_member_use
                                color: kPrimaryColor,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Unduh Lampiran Kegiatan',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                ),
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
