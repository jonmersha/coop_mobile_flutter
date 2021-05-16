import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransationDetailResponse extends StatefulWidget {

  var data;
  TransationDetailResponse(this.data);
  @override
  _TransationDetailResponseState createState() => _TransationDetailResponseState(this.data);
}

class _TransationDetailResponseState extends State<TransationDetailResponse> {
  var _data;
  _TransationDetailResponseState(this._data);
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
        appBar: APPBarChieledPage("App Connect Test",'Transaction Detail').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [

                Text('Debit Account='+_data['DEBITACCOUNT'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('Credit Account='+_data['CREDITACCOUNT'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('Debit/credit amount='+_data['AMOUNT'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('MMT reference='+_data['MMTREFERENCE'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('Transaction Reference='+_data['FTREFERENCE'].toString(),style: TextStyle(fontSize: 20.0),),
                Text('Transaction Date='+_data['DATE'].toString(),style: TextStyle(fontSize: 20.0),),



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







