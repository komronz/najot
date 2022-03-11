import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class KraudfandingCardWidget extends StatelessWidget {
  KraudfandingCardWidget({
    required this.image,
    required this.name,
    required this.title,
    required this.isFavorite,
    required this.progres, Key? key}) : super(key: key);
  String image, name,title;
  double progres;
  bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      height: 267.h,
      width: 162.w,
      decoration: BoxDecoration(
        // boxShadow: [
        //   new BoxShadow(
        //       color: Color.fromRGBO(11, 191, 144, 0.08),
        //       offset: new Offset(0.0, 1.5),)],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children :[
              Container(
                child: ClipRRect(
                  child: Image.asset(image,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                height: 140.h,
                width: 162.w,
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 7,top: 7),
                      padding: EdgeInsets.all(4.0),
                      width: 77.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Text(name,textAlign:TextAlign.center,style: TextStyle(color:Color(0xFF0DAD84),fontSize: 10,fontWeight: FontWeight.w400),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10,top: 7),
                      padding: EdgeInsets.all(5.0),
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: isFavorite?Color(0xFF07C025):Color(0xFFFFE7E7),
                      ),
                      child: Container(
                        child: SvgPicture.asset(isFavorite?"assets/images/favorite_add.svg":"assets/images/favorite_remove.svg"),
                      ),
                    ),
                  ],
                ),
              ),
            ],),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 12,left: 12,right: 5),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,maxLines: 2,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Container(
                      height: 6.h,
                      width: 142.w,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(right: 9, top: 13,bottom: 13),
                      child: LinearProgressIndicator(
                        value: progres,
                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF0BBF90)),
                        backgroundColor: Color(0xFFE8FEF9),
                        minHeight: 6,
                      )
                  ),
                  Text("Bajarildi",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Color(0xFF939598)),),
                  SizedBox(height: 4.0.h,),
                  Text("60%",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xFF0344A7)),),
                ],
              ),

            ),
          ),
        ],
      ),

    );
  }
}




