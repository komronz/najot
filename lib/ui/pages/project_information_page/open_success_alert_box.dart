import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future openSuccessAlertBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(top: 283),
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                margin: EdgeInsets.only(top: 20.0, left: 24, right: 24),
                width: 335.w,
                height: 294.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 88.h,
                      width: 88.w,
                      child: Image.asset('assets/images/success.png'),
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    Image.asset('assets/images/send_success.png'),

                    SizedBox(height: 14.h),
                    Text("Iltimos mualif javobini kuting!",style: TextStyle(color: Color(0xFF6D6E71),fontWeight:FontWeight.w500,fontSize: 14),),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          height: 48.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFECFFFA),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: Text(
                              "Xop, raxmat",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
