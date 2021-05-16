import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/model/TransationDetailResponseModel.dart';
import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/BlalanceResponse.dart';
import 'package:coop_mobile/response/GiveneDateStatementResponse.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:coop_mobile/response/TransationDetailResponse.dart';
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
  final narratives=TextEditingController();
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
                  child: UserInputTextField(narratives,'Narratives'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(mmtTransactionID,'MMT Transaction Id'),
                ),

                Container(
                    child: ElevatedButton(child:Text('Fund Transfer'),onPressed: ()=>miniStatement())
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
    request.body =

''' {
    "InternalFundTransferRequest": {
        "ESBHeader": {
            "serviceCode": "600000",
            "channel": "USSD",
            "Service_name": "MMTACCTTXN",
            "Message_Id": "MM582729"
        },
        "WebRequestCommon": {
            "company": "ET0010001",
            "password": "123123",
            "userName": "MMTUSER1"
        },
        "OfsFunction": {
            "messageId": "P345343787"
        },
        "FUNDSTRANSFERACTRMMTType": {
            "id": "",
            "DebitAccount": "1000000004077",
            "DebitCurrency": "ETB",
            "DebitAmount": "10",
            "DebitValueDate": " ",
            "DebitNarrative": "TEST2",
            "CreditNarrative": "TEST2",
            "CreditAccount": "1000065305252",
            "gORDERINGCUST": {
                "g": "1",
                "OrderedBy": "TEST"
            },
            "MMTTransactionId": "P3453437"
        }
    }
}''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();

      var data=convert.jsonDecode(val);
      if(data['AccountDetailsResponse']['ESBStatus']['Status']=='Failure')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: data['AccountDetailsResponse']['ESBStatus']['errorDescription'][1],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
       data= data['AccountDetailsResponse']['ACCTBRANCHResponse']['ACCTCOMPANYVIEWType'][0]['gACCTCOMPANYVIEWDetailType']['mACCTCOMPANYVIEWDetailType'];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>AccountDetailResponse(data)),
      );
    }

    }
    else {
    print(response.reasonPhrase);
    }
  }
}







