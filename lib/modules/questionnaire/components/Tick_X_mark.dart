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
         Container(
           color: Colors.transparent,
           child: 
          Center(
            child: IconButton(
                           icon: Icon(
                  Icons.query_builder,
                  size: 50,
                  color: Color(0xFF66B9C4),
                ),
                onPressed: onYes),
          ),),
          Container(
            width: MediaQuery.of(context).size.width / 8,
          ),
           Container(
           color: Colors.transparent,
           child: 
          Center(
            child: IconButton(
              icon: Icon(
                Icons.not_interested,
                size: 50,
                color: Color(0xFF66B9C4),
              ),
              onPressed: onNO),
          ),),
          
          Padding(
            padding: EdgeInsets.only(
              left: 40,
            ),
            child: Text(
              "?",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF66B9C4),
                //Color(0xFFFF8C10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
