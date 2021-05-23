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

class DebitCardReplacementRequest extends StatefulWidget {


  @override
  _DebitCardReplacementRequestState createState() => _DebitCardReplacementRequestState();
}

class _DebitCardReplacementRequestState extends State<DebitCardReplacementRequest> {


  final accountNumber=TextEditingController();


  _DebitCardReplacementRequestState();
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
        appBar: APPBarChieledPage("App Connect Test",'Debit Card Replacement').buildPreferredSize(),
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
                    child: ElevatedButton(child:Text('Send Request'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'Replacement Requesting...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.1.245.150:7080/v1/cbo/'));
    request.body =
    '''
    {
    "DebitCardReplacementRequest": {
        "ESBHeader": {
            "serviceCode": "160000",
            "channel": "USSD",
            "Service_name": "callOfs",
            "Message_Id": "MM582729"
        },
        "ApplicationName": "CBO.CARD.REG.DET",
        "Options": {
            "VersionName": "INP2.ACE",
            "Function": "I",
            "Operation": "PROCESS"
        },
        "UserInformation": {
            "UserId": "METASEBIAYIM",
            "PassWord": "@Tamgaw00@",
            "CompanyID": "ET0010222"
        },
        "TransactionID": "1000000000028",
        "MessageData": [
            {
                "FieldName": "CUSTOMER.ID",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": ""
            },
            {
                "FieldName": "CUS.TITLE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "1:MR"
            },
            {
                "FieldName": "CARD.REQ.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "OLD"
            },
            {
                "FieldName": "DEBIT.CARD.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "4:IFB DEBIT CARD"
            },
            {
                "FieldName": "NAME.ON.CARD",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "OROMIA"
            },
            {
                "FieldName": "MARITAL.STATUS",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "1:Single"
            },
            {
                "FieldName": "GENDER",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "M"
            },
            {
                "FieldName": "IDENTITY.NO",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "1002272462"
            },
            {
                "FieldName": "IDENTITY.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "1:Civil ID"
            },
            {
                "FieldName": "ADDRESS.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "01:Mailing Address"
            },
            {
                "FieldName": "ADDRESS",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "ADDIS ABABA"
            },
            {
                "FieldName": "PHONE.NO",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "+251911427707"
            }
        ]
    }
}
    '''
    ;
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







