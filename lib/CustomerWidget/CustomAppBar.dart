
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/CustomerWidget/custom_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class APPBarChieledPage extends StatelessWidget{
  String title;
  String subTitle;
  APPBarChieledPage(this.title,this.subTitle);
  @override
  Widget build(BuildContext context) {
    return this.buildPreferredSize();
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize:Size.fromHeight(120.0),
      child: AppBar(
        elevation: 10,
        backgroundColor: CustomColor.cyan_blue,
        flexibleSpace: Container(
          // color: CustomColor.white,

          child: Padding(
            padding: const EdgeInsets.only(top: 40),


            child: Wrap(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: HeaderText(title,  25.5,0.0,CustomColor.white,)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(subTitle, 20.2, 0.0, CustomColor.white)

                  ],
                )
              ],

            ),
          ),
        ),

      ),
    );

  }

}
