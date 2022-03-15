import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/project_information_page/open_success_alert_box.dart';

class OpenAlertBoxWidget extends StatelessWidget {
  const OpenAlertBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 117),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24.0),
            width: 335.w,
            height: 400.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Muallifga savol yozish ",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF414042),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 18.0.h,
                ),
                Container(
                  height: 46.h,
                  padding: EdgeInsets.only(top: 10, left: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFF79B4A8),
                      )),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Savol sarlavhasi",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Color(0xFFBCBEC0), fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  height: 169.h,
                  width: 287.w,
                  padding: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFF79B4A8),
                      )),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Savol yozing",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Color(0xFFBCBEC0), fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                GestureDetector(
                  onTap: () {
                    openSuccessAlertBox(context);
                  },
                  child: Container(
                      height: 48.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF0BBF90),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Text(
                          "Yuborish",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      height: 48.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBF8F4),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        "Chiqish",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ).paddingAll(10)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
