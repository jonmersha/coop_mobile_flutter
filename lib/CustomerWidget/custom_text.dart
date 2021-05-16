
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double textSize;
  double spacing;
  Color textColor;
  CustomText(this.text, this.textSize, this.spacing, this.textColor);
  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.infinity,
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                  letterSpacing:spacing),
              ),
        ),

    );
  }
}
// ignore: must_be_immutable
class CustomTextPair extends StatelessWidget {
  String label;
  String text;
  double textSize;
  double spacing;
  Color textColor;
  CustomTextPair(this.label, this.text, this.textSize, this.spacing, this.textColor);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(

        width: double.infinity,
        color: Colors.black45,


              child:  Row(
                children: [

                  Container(
                        width: 170,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            label,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing:spacing),
                              ),
                        ),

                    ),

                  Container(
                    //width: double.infinity,

                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                              letterSpacing:spacing),
                        ),
                      ),
                    ),

                  ),
                ],
              ),


    ));
  }
}
class HeaderText extends StatelessWidget {
  String text;
  double textSize;
  double spacing;
  Color textColor;
  HeaderText(this.text,this.textSize,this.spacing,this.textColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
          style: TextStyle(color: textColor,
              fontSize: textSize,
              letterSpacing:spacing,

          ),
          ),
    );
  }
}
