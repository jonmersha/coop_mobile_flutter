import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CommonData.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/BulkFundTransferResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BulkFundTransferCredit extends StatefulWidget {
  @override
  _BulkFundTransferCreditState createState() => _BulkFundTransferCreditState();
}

class _BulkFundTransferCreditState extends State<BulkFundTransferCredit> {


  final accountNumber=TextEditingController();


  _BulkFundTransferCreditState();
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
        appBar: APPBarChieledPage("App Connect Test",'Bulk Fund Transfer Credit').buildPreferredSize(),
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
                    child: ElevatedButton(child:Text('Start Bulk Transfer'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'Bulk Crediting...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://${CommonData.ip}:7080/v1/cbo?id=8'));
    request.body ='''
    {
    "BulkFundTransferRequest": {
        "ESBHeader": {
            "serviceCode": "120000",
            "channel": "USSD",
            "Service_name": "callOfs",
            "Message_Id": "MM582729"
        },
        "ApplicationName": "FT.BULK.CREDIT.AC",
        "Options": {
            "VersionName": "INPUT",
            "Function": "I",
            "Operation": "PROCESS"
        },
        "UserInformation": {
            "UserId": "METASEBIAYIM",
            "PassWord": "@Tamgaw00@",
            "CompanyID": ""
        },
        "MessageData": [
            {
                "FieldName": "DR.CURRENCY",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "ETB"
            },
            {
                "FieldName": "DR.ACCOUNT",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "ETB1204300010001"
            },
            {
                "FieldName": "DR.AMOUNT",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "1000.00"
            },
            {
                "FieldName": "NARRATIVE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": ""
            },
            {
                "FieldName": "CR.CURRENCY",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "ETB"
            },
            {
                "FieldName": "CR.ACCOUNT",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "ETB1446700010222"
            },
            {
                "FieldName": "CR.AMOUNT",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "600.00"
            },
            {
                "FieldName": "CR.ACCOUNT",
                "MultiValueNumber": "2",
                "SubvalueNumber": "1",
                "FieldContent": "ETB1446700010104"
            },
            {
                "FieldName": "CR.AMOUNT",
                "MultiValueNumber": "2",
                "SubvalueNumber": "1",
                "FieldContent": "400.00"
            }
        ]
    }
}
}
    ''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();

      var data=convert.jsonDecode(val);


      if(data['BulkFundTransferResponse']['ESBStatus']['Status']!='Success')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: data['BulkFundTransferResponse']['ESBStatus']['responseCode'],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
       data= data['BulkFundTransferResponse']['MessageData'];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>BulkFundTransferResponse(data)),
      );
    }

    }
    else {
    print(response.reasonPhrase);
    }
  }
}







