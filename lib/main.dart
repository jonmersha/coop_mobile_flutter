import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/menu.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(MaterialApp(
    title: 'Coop Mobile',
    home: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: APPBarChieledPage("CoopBank",'App Connect Test').buildPreferredSize(),
      body: SafeArea(
        child: MainMenu(),
      ),
    ),
  ));

}

class CoopBankMain extends StatefulWidget {
  const CoopBankMain({Key key}) : super(key: key);

  @override
  _CoopBankMainState createState() => _CoopBankMainState();
}




class _CoopBankMainState extends State<CoopBankMain> {
  @override
  Widget build(BuildContext context) {
    return     Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    );

  }
}
