import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'kraudfanding_widget/kraudfanding_card_widget.dart';
import 'kraudfanding_widget/kraudfanding_widgets.dart';
class KraudFandingPage extends StatefulWidget {
  const KraudFandingPage({Key? key}) : super(key: key);
  @override
  _KraudFandingPageState createState() => _KraudFandingPageState();
}

class _KraudFandingPageState extends State<KraudFandingPage> {
  List<KraudfandingCardWidget> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FCFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF6FCFA),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 31.w,
                height: 34.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFECFCF1),
                ),
                child: Icon(
                  Icons.chevron_left,
                  size: 30.0.h,
                  color: Color(0xFF004D39),
                ),
              ),
            ),
            SizedBox(width: 71.w),
            Text(
              "Kraudfanding",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF414042)),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 18.0.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.only(left: 18.0),
              height: 48.0.h,
              width: 335.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 1,
                  color: Color(0xFF79B4A8),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Loyiha nomini kiriting",
                        // suffixIcon: Icon(Icons.search_rounded, color: Color(0xFF048D6A),),
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Color(0xFFBCBEC0), fontSize: 14),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 21,
                        width: 21,
                        child: Image.asset("assets/images/search.png")),
                  ),
                ],
              )),
          SizedBox(
            height: 24.0.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 163.h,
            width: 359.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color(0xFFF1FFFB),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        width: 153.w,
                        height: 112.h,
                        child: Image.asset("assets/images/splash_2.png"))),
                SizedBox(width: 14.w),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Expanded(
                          child: Text(
                        "G'oya bor ammo maglag' yo'q?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(height: 5),
                      Text(
                        "Biz sizga yordam beramiz!",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 146.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF0BBF90),
                          ),
                          child: Text(
                            "Loyiha qo'shish",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 24.0.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 19),
            height: 309.h,
            width: 511.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Yangi Qo'shilganlar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 18.0.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  KraudfandingCardWidget(
                    title: "Drenajni kuzatish uchun mo'ljalangan uskunalar",
                    name: 'Texnologiya',
                    isFavorite: true,
                    image: 'assets/images/rasm.jpg',
                    progres: 0.6,
                  ),
                  KraudfandingCardWidget(
                    title: "Drenajni kuzatish uchun mo'ljalangan",
                    name: 'Texnologiya',
                    isFavorite: false,
                    image: 'assets/images/rasm.jpg',
                    progres: 0.6,
                  ),
                  KraudfandingCardWidget(
                    title: "Drenajni kuzatish uchun mo'ljalangan",
                    name: 'Texnologiya',
                    isFavorite: true,
                    image: 'assets/images/rasm.jpg',
                    progres: 0.6,
                  ),
                ]),
              ),
            ]),
          ),
          SizedBox(
            height: 24.0.h,
          ),
          Container(
            width: 375.w,
            height: 688.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11.0),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 18, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Kategoriyalar",
                      style: TextStyle(
                          color: Color(0xFF414042),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Container(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            singleTab(true, "Barchasi"),
                            singleTab(false, "Texnologiya"),
                            singleTab(false, "Texnologiya"),
                            singleTab(false, "Texnologiya"),
                            singleTab(false, "Texnologiya"),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 24.0.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
