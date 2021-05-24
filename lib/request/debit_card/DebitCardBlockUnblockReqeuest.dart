import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';

import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/DebitCardReplacementResponse.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DebitCardBlockUnblockRequest extends StatefulWidget {


  @override
  _DebitCardBlockUnblockRequestState createState() => _DebitCardBlockUnblockRequestState();
}

class _DebitCardBlockUnblockRequestState extends State<DebitCardBlockUnblockRequest> {


  final accountNumber=TextEditingController();
  final date=TextEditingController();
  final cardStatus=TextEditingController();


  _DebitCardBlockUnblockRequestState();
  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }
    accountNumber.text=  "1000000077546";
    date.text=  "20220313";
    cardStatus.text=  "91";
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Debit Card Block Unblock').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(accountNumber,'Customer Bank Account'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(date,'Expiry Date'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(cardStatus,'Card Status'),
                ),

                Container(
                    child: ElevatedButton(child:Text('block/unblock'),onPressed: ()=>cardBlockUnblock())
                ),

              ],
            )
        )
    );


  }

  cardBlockUnblock() async {
    Methods.showLoaderDialog(context,'Starts blocking...');
    var headers = {
      'Content-Type': 'application/json'
    "Access-Control-Allow-Origin: *"

  };
    var request = http.Request('POST', Uri.parse('http://10.1.245.150:7080/v1/cbo/'));
    request.body ='''{
    "DebitCardBlockAndUnBlockRequest": {
        "ESBHeader": {
            "serviceCode": "170000",
            "channel": "USSD",
            "Service_name": "callOfs",
            "Message_Id": "MM582729"
        },
        "ApplicationName": "CARD.ISSUE",
        "Options": {
            "VersionName": "INPUT.ACE",
            "Function": "I",
            "Operation": "PROCESS"
        },
        "UserInformation": {
            "UserId": "METASEBIAYIM",
            "PassWord": "@Tamgaw00@",
            "CompanyID": "ET0010222"
        },
        "TransactionID": "ATM.9572055445584801",
        "MessageData": [
            {
                "FieldName": "CARD.STATUS",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${cardStatus.text}"
            },
            {
                "FieldName": "ACCOUNT",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${accountNumber.text}"
            },
            {
                "FieldName": "EXPIRY.DATE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${date.text}"
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


      if(data['DebitCardBlockUnBlockResponse']['MessageData']==null)
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: 'No Data Returned From server',
          btnCancelOnPress:(){} ,
        ).show();

      else{
        data= data['DebitCardBlockUnBlockResponse']['MessageData'];
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>DebitCardRequestResponse(data)),
        );
      }

    }
    else {
    print(response.reasonPhrase);
    }
  }
}







