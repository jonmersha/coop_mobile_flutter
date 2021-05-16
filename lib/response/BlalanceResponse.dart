import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BalanceResponse extends StatefulWidget {

  var data;
  BalanceResponse(this.data);
  @override
  _BalanceResponseState createState() => _BalanceResponseState(this.data);
}

class _BalanceResponseState extends State<BalanceResponse> {
  var _data;
  _BalanceResponseState(this._data);
  final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Account Balance').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [

              Text('Working Balance\t ='+_data['WorkingBal'].toString(),style: TextStyle(fontSize: 20.0),),
              Text('Ledger Balance\t ='+_data['LedgerBal'].toString(),style: TextStyle(fontSize: 20.0)),
              Text('Cleared Balance\t ='+_data['ClearedBal'].toString(),style: TextStyle(fontSize: 20.0)),
              Text('Use able Balance\t ='+_data['UseableBal'].toString(),style: TextStyle(fontSize: 20.0)),
              Text('LockedAmount\t ='+_data['LockedAmount'].toString(),style: TextStyle(fontSize: 20.0)),
            ]),
            )
        );



  }

  miniStatement() async {
    print('');

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.1.245.150:7080/v1/cbo/'));
    request.body = '''{\n    "MiniStatementRequest":{\n    "ESBHeader":{\n    "serviceCode": "100000",\n    "channel":"USSD",\n    "Service_name":"MMTSTMT",\n    "Message_Id":"6255726662"\n},\n"WebRequestCommon": {\n"company": "ET0010222",\n"password": "123456",\n"userName": "REGASAALC"\n},\n"EMMTMINISTMTType": [{\n"columnName": "ACCOUNT",\n"criteriaValue":"1000000067567",\n"operand": "EQ"\n}\n]\n}\n}\n''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }


}







