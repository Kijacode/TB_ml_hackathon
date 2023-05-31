// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TickXMark extends StatefulWidget {
  const TickXMark({super.key,  required this.onYes , required this.onNO,required this.isClicked});
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
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: widget.isClicked ? SizedBox(
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
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset("assets/images/tick.svg"),
                ),
                onTap:()=> widget.onYes()
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
              child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset("assets/images/cancel.svg"),
              ),
              onTap:()=> widget.onNO(),
            )
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: SizedBox(
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
