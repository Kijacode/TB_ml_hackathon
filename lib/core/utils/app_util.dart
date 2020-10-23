


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtil{



    static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }

   static showToastMessage(
      {String message, ToastGravity position = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        backgroundColor: Color(0xFF656565));
  }

  static showPopUpModal(
      BuildContext context, Widget modal, bool diablePadding) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            child: Container(
              child: Padding(
                padding: diablePadding
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(
                        bottom: 12, top: 5, right: 5, left: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 22,
                                width: 22,
                                child: SvgPicture.asset(
                                    'assets/images/close_icon.svg'),
                              ),
                            )
                          ],
                        ),
                      ),
                      modal
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}