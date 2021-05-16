

import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInputTextField extends StatelessWidget {
  var  controller=TextEditingController();
  String hintText;
  Colors mainColor;
  Colors hintColor;
  UserInputTextField(this.controller,this.hintText);
  @override
  Widget build(BuildContext context) {
    return
      Container(

        height: 50.0,
        padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),

          child: TextFormField(
              cursorColor: CustomColor.white,

              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0
              ),
              controller: controller,
              // inputFormatters: [LengthLimitingTextInputFormatter(4),],
              keyboardType:TextInputType.text,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1,color: Colors.blue),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1,color: CustomColor.cyan_blue),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1,color: CustomColor.cyan_blue),

                ),

                // icon: Icon(Icons.account_box,color: Colors.black),
                labelText: hintText,
                labelStyle: TextStyle(color: CustomColor.black),


                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: new BorderSide(color: CustomColor.cyan_blue)
                ),
              )


          ),
        ),

      );

  }
}
