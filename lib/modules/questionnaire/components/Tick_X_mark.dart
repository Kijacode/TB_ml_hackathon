import 'package:flutter/material.dart';

class TickXMark extends StatelessWidget {
  const TickXMark({Key key,this.onYes ,this.onNO}) : super(key: key);
  final Function onYes;
  final Function onNO;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.query_builder,
                size: 50,
                color: Color(0xFFFF8C10),
              ),
              onPressed: onYes),
          Container(
            width: MediaQuery.of(context).size.width / 8,
          ),
          IconButton(
              icon: Icon(
                Icons.not_interested,
                size: 50,
                color: Color(0xFFFF8C10),
              ),
              onPressed: onNO),
          Padding(
            padding: EdgeInsets.only(
              left: 40,
            ),
            child: Text(
              "?",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF8C10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
