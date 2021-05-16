
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/CustomerWidget/custom_text.dart';
import 'package:coop_mobile/CustomerWidget/flat_button.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String title;
  String boyText;
  Object object;
  Color colors;

  Color colorBack;
  Color colorHeader;
  Color colorBody;
  Icon icon;
  Icons myIcon;
  double iconSize;
  CustomCard(this.object,this.title,this.boyText,this.colorBack,this.colorHeader,this.icon,this.iconSize){
    //iconSize=50;

  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 10.2,
           color:colorBody,
           shadowColor: CustomColor.cyan_blue,
          borderOnForeground: true,

          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>object),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        CustomFlatButton(this.object,this.icon,this.title,context,iconSize,colorHeader),
                        Container(
                           // margin: EdgeInsets.only(left: 1.0,right: 10.0,bottom: 2,top: 0),
                            color: Colors.blue,
                            width: double.infinity,
                            height: .5),

                        HeaderText(title, 15, 0, colorHeader,),

                       //Center(child: CustomText(boyText, 13, 1,Colors.white )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
