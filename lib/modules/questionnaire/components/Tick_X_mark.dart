import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TickXMark extends StatefulWidget {
  const TickXMark({Key key, this.onYes, this.onNO,this.isClicked}) : super(key: key);
  final Function onYes;
  final Function onNO;
  final bool isClicked;

  @override
  _TickXMarkState createState() => _TickXMarkState();
}

class _TickXMarkState extends State<TickXMark> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: widget.isClicked ? Container(
              height: 50,
              width: 50,
              child: SvgPicture.asset("assets/images/cloud-computing.svg"),
            ):
      Row(
        children: [
          Container(
            color: Colors.transparent,
            child: Center(
              child: GestureDetector(
                child: Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset("assets/images/tick.svg"),
                ),
                onTap: widget.onYes,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 8,
          ),
          Container(
            color: Colors.transparent,
            child: Center(
                child: GestureDetector(
              child: Container(
                height: 30,
                width: 30,
                child: SvgPicture.asset("assets/images/cancel.svg"),
              ),
              onTap: widget.onNO,
            )
                ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 40,
            ),
            child: Container(
              height: 20,
              width: 20,
              child: SvgPicture.asset("assets/images/question-mark.svg"),
            ),
          )
        ],
      ),
    );
  }
}
