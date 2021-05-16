import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/response/BlalanceResponse.dart';
import 'package:coop_mobile/response/GiveneDateStatementResponse.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BalanceRequest extends StatefulWidget {
  @override
  _BalanceRequestState createState() => _BalanceRequestState();
}

class _BalanceRequestState extends State<BalanceRequest> {
  final accountNumber=TextEditingController();
  final givenDat=TextEditingController();
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
        appBar: APPBarChieledPage("App Connect Test",'Account Balance').buildPreferredSize(),
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
                    child: ElevatedButton(child:Text('Balance Request'),onPressed: ()=>miniStatement())
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
    request.body = '''{\n  "BalanceEnquiryRequest": {\n    "ESBHeader": {\n      "serviceCode": "300000",\n      "channel": "USSD",\n      "Service_name": "MMTACCTBALANCE",\n      "Message_Id": "6255726662"\n    },\n    "WebRequestCommon": {\n      "company": "ET0010222",\n      "password": "123456",\n      "userName": "REGASAALC",\n      "serviceCode": "30",\n      "channel": "USSD"\n    },\n    "ACCTBALCTSType": [\n      {\n        "columnName": "ACCOUNT.NUMBER",\n        "criteriaValue": "${accountNumber.text}",\n        "operand": "EQ"\n      }\n    ]\n  }\n}\n''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();
      var data=convert.jsonDecode(val);

      if(data['BalanceEnquiryResponse']['ACCTBALCTSType']['ZERORECORDS']=='No Accounts to display')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: response.statusCode.toString(),
          desc: data['BalanceEnquiryResponse']['ACCTBALCTSType']['ZERORECORDS'],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
      data=  data['BalanceEnquiryResponse']['ACCTBALCTSType']['gACCTBALCTSDetailType']['mACCTBALCTSDetailType']['mACCTBALCTSDetailType'];
      print(data[0]);

      //Displating other page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>BalanceResponse(data)),
      );
    }}
    else {
    print(response.reasonPhrase);
    }
  }


}







