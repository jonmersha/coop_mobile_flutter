import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/model/TransationDetailResponseModel.dart';
import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/BlalanceResponse.dart';
import 'package:coop_mobile/response/FXResponse.dart';
import 'package:coop_mobile/response/GiveneDateStatementResponse.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:coop_mobile/response/TransationDetailResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FXRateInfromation extends StatefulWidget {


  @override
  _FXRateInfromationState createState() => _FXRateInfromationState();
}

class _FXRateInfromationState extends State<FXRateInfromation> {


  final accountNumber=TextEditingController();


  _FXRateInfromationState();
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
        appBar: APPBarChieledPage("App Connect Test",'FX Rate').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [


                Container(
                    child: ElevatedButton(child:Text('Get Currency Rate'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'Getting FX rate...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.0.19.102:7080/v1/cbo?id=14'));
    request.body ='''{\n    "CURRENCYRATESRequest": {\n        "ESBHeader": {\n            "serviceCode": "700000",\n            "channel": "USSD",\n            "Service_name": "CURRENCYRATES",\n            "Message_Id": "6255726662"\n        },\n        "WebRequestCommon": {\n            "company": "ET0010222",\n            "password": "123456",\n            "userName": "REGASAALC"\n        },\n        "CURRENCYRATESType": [\n            {\n                "columnName": "",\n                "criteriaValue": "",\n                "operand": ""\n            }\n        ]\n    }\n}'''
    ;
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();
     // print(val);


    //  Map<String, dynamic> data = jsonDecode(val);
      var data=convert.jsonDecode(val);


      if(data['CURRENCYRATESResponse']['Status']['successIndicator']!='Success')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: 'Failed to get Currency information',
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
       data= data['CURRENCYRATESResponse']['CURRENCYRATESType']['gCURRENCYRATESDetailType']['mCURRENCYRATESDetailType'];
       print(data);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>FXResponse(data)),
      );
    }

    }
    else {
    print(response.reasonPhrase);
    }
  }


}







