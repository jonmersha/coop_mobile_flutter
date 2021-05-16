
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/CustomerWidget/custom_text.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomFlatButton extends StatelessWidget {
  String menuTitle;
  int operationSelector;
  BuildContext context;
  Object object;
  Icon myAcon;
  double iconSize;
  Color iconColor;
  CustomFlatButton(this.object, this.myAcon,this.menuTitle,this.context,this.iconSize,this.iconColor){
    //this.myAcon=imageIcon as Icon;
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 0.0,bottom: 5),
      child: Wrap(
        children: <Widget>[
          Container(
              child: Center(
                  child: IconButton(onPressed: ()=> performTask(this.operationSelector), icon: this.myAcon,iconSize: iconSize,color: CustomColor.cyan_blue,),
                ),
              ),


        ],
      ),
    );
  }
  performTask(int operationSelector) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>object),
        );
  }
}
class MainMenuIcon extends StatelessWidget {
  String imageIcon;
  String menuTitle;
  int operationSelector;
  BuildContext context;
  Object object;
  MainMenuIcon(this.object,this.imageIcon, this.menuTitle,this.context);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),

      child: Wrap(
        children: <Widget>[
          Container(
              child: Center(

                  child: FlatButton(
                    //color: Colors.green,
                    padding:  const EdgeInsets.all(12.0),
                    child: Image.asset('images/${this.imageIcon}'),
                    onPressed: ()=> performTask(this.operationSelector)
                    ,

                ),
              ),
              padding: const EdgeInsets.all(1.0), // border width
              decoration: new BoxDecoration(
               color: Colors.white,
                shape: BoxShape.circle,
              )
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Center(
              child: CustomText(this.menuTitle,13.0,1, const Color(0xFFFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
  performTask(int operationSelector) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>object),
        );
  }
}
