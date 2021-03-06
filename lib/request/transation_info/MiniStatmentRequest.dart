import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MiniStatment extends StatefulWidget {
  @override
  _BalanceEnqueryState createState() => _BalanceEnqueryState();
}

class _BalanceEnqueryState extends State<MiniStatment> {

  final accountNumber=TextEditingController();

  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }

    accountNumber.text=  "1000000067567";

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Mini Statement').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(accountNumber,'Account Number'),
                ),
                Container(
                    child: ElevatedButton(child:Text('Mini Statement'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'Mini Statement Request...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.1.245.150:7080/v1/cbo/'));
    request.body = '''{
    "MiniStatementRequest":
    { "ESBHeader":{    
            "serviceCode": "100000",
            "channel":"USSD",   
            "Service_name":"MMTSTMT",    
            "Message_Id":"6255726662"},
            "WebRequestCommon": {
              "company": "ET0010222",
              "password": "123456",
              "userName": "REGASAALC"},
              "EMMTMINISTMTType": 
                    [
                      {
                      "columnName": "ACCOUNT",
                      "criteriaValue":"${accountNumber.text}",
                      "operand": "EQ"
                      }
                    ]
              }
              }''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();
      var data=convert.jsonDecode(val);

      data=  data['MiniStatementResponse']['EMMTMINISTMTType']['gEMMTMINISTMTDetailType']['mEMMTMINISTMTDetailType'];
      print(data[0]);

      //Displating other page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>MiniStatementResponse(data)),
      );
    }
    else {
    print(response.reasonPhrase);
    }
  }


}







