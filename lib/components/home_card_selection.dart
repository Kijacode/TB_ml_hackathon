import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCardSelection extends StatelessWidget {
  HomeCardSelection({@required this.icon, @required this.title,@required this.onPage});
  final String icon;
  final String title;
  final Function onPage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPage ,
          child: Container(
        // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Material(
          type: MaterialType.card,
          elevation: 9,
          child: Container(
              height: MediaQuery.of(context).size.height / 5,
              // // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

              color: Color(0xFFFF8C10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [SvgPicture.asset(icon),
                
                 Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)],
              )),
        ),
      ),
    );
  }
}
