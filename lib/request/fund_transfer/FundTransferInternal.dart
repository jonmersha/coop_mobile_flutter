import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CommonData.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/FundTransferResponse.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FundTransferInternal extends StatefulWidget {


  @override
  _FundTransferInternalState createState() => _FundTransferInternalState();
}

class _FundTransferInternalState extends State<FundTransferInternal> {


  final debitAccount=TextEditingController();
  final creditAccount=TextEditingController();
  final amount=TextEditingController();
  final crNarratives=TextEditingController();
  final drNarratives=TextEditingController();
  final orderedBY=TextEditingController();
  final mmtTransactionID=TextEditingController();



  _FundTransferInternalState();
  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }
    debitAccount.text=  "1000000004077";
    creditAccount.text=  "1000065305252";
    amount.text='120';
    crNarratives.text='TEST2';
    drNarratives.text='TEST2';

    mmtTransactionID.text='P3453437';
    orderedBY.text='TEST';

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Fund Transfer').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(debitAccount,'Debit Account'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(creditAccount,'Credit Account'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(amount,'Amount'),
                ),

                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(crNarratives,'Credit Naratives'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(drNarratives,'Debit  Narratives'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(orderedBY,'Order BY'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(mmtTransactionID,'MMT Transaction Id'),
                ),

                Container(
                    child: ElevatedButton(child:Text('Fund Transfer'),onPressed: ()=>sendMoney())
                ),

              ],
            )
        )
    );


  }





  sendMoney() async {


   // print(body);
    Methods.showLoaderDialog(context,'Fund Transfer...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://${CommonData.ip}:7080/v1/cbo/'));
    request.body = '''{
    "InternalFundTransferRequest": {
        "ESBHeader": {
            "serviceCode": "600000",
            "channel": "USSD",
            "Service_name": "MMTACCTTXN",
            "Message_Id": "MM582720"
        },
        
        "WebRequestCommon": {
            "company": "ET0010001",
            "password": "123123",
            "userName": "MMTUSER1"
        },
        "OfsFunction": {
            "messageId": "P345343778"
        },
        "FUNDSTRANSFERACTRMMTType": {
            "id": "",
            "DebitAccount": "${debitAccount.text}",
            "DebitCurrency": "ETB",
            "DebitAmount": "${amount.text}",
            "DebitValueDate": " ",
            "DebitNarrative": "${drNarratives.text}",
            "CreditNarrative": "${creditAccount.text}",
            "CreditAccount":"${creditAccount.text}" ,
            "gORDERINGCUST": {
                "g": "1",
                "OrderedBy": "${orderedBY.text}"
            },
            "MMTTransactionId": "${mmtTransactionID.text}"
        }
    }
}''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();
      print('\n'+val);


      var data=convert.jsonDecode(val);
      if(data['InternalFundTransferResponse']['ESBStatus']['Status']!='Success')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: data['InternalFundTransferResponse']['ESBStatus']['errorDescription'].toString(),
          btnCancelOnPress:(){
            Navigator.pop(context);
            } ,
        ).show();

else{
        data= data['InternalFundTransferResponse']['FUNDSTRANSFERType'];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>FundTransferResponse(data)),
      );
    }

    }
    else {
    print(response.reasonPhrase);
    }
  }
}







