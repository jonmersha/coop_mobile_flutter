import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountDetailResponse extends StatefulWidget {

  var data;
  AccountDetailResponse(this.data);
  @override
  _AccountDetailResponseState createState() => _AccountDetailResponseState(this.data);
}

class _AccountDetailResponseState extends State<AccountDetailResponse> {
  var _data;
  _AccountDetailResponseState(this._data);
  final accountNumber=TextEditingController();

  @override
  Widget build(BuildContext context) {
     //_data=_data['MMTFTVIEWResponse']['EMMTTXNFTType'][0]['gEMMTTXNFTDetailType'];

    print(_data);

    // _data=  _data['GetTransactionDetailsResponse']['MMTFTVIEWResponse']['EMMTTXNFTType']['gEMMTTXNFTDetailType'];

    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Cuatomer Account Detail').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [

                Text('Account title='+_data['ACCOUNTTITLE1'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('Branch Code='+_data['COCODE'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('Branch Name='+_data['BRANCHNAME'].toString(),style: TextStyle(fontSize: 20.0),),



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







