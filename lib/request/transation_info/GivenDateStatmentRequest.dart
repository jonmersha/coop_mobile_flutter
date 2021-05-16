import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/response/GiveneDateStatementResponse.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GivenDateStatementRequest extends StatefulWidget {
  @override
  _GivenDateStatementRequestState createState() => _GivenDateStatementRequestState();
}

class _GivenDateStatementRequestState extends State<GivenDateStatementRequest> {
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
    givenDat.text=  "20191112";


    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Given Date Statement').buildPreferredSize(),
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
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(givenDat,'Date'),
                ),
                Container(
                    child: ElevatedButton(child:Text('Get Statement'),onPressed: ()=>miniStatement())
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
    request.body = '''
    {
    "AccountstatementForAGivenDateRequest": {
        "ESBHeader": {
            "serviceCode": "200000",
            "channel": "USSD",
            "Service_name": "STMTDATE",
            "Message_Id": "6255726662"
        },
        "WebRequestCommon": {
            "company": "ET0010001",
            "password": "123123",
            "userName": "MMTUSER1"
        },
        "EMMTMINISTMTDATEType": [
            {
                "columnName": "ACCOUNT",
                "criteriaValue": "${accountNumber.text}",
                "operand": "EQ"
            },
            {
                "columnName": "BOOKING.DATE",
                "criteriaValue": "${givenDat.text}",
                "operand": "EQ"
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

      if(data['AccountStatementForAGivenDateResponse']['ESBStatus']['status']=='FAILURE')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: response.statusCode.toString(),
          desc: data['AccountStatementForAGivenDateResponse']['ESBStatus']['errorDescription'],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
      data=  data['AccountStatementForAGivenDateResponse']['EMMTMINISTMTDATEType']['gEMMTMINISTMTDATEDetailType']['mEMMTMINISTMTDATEDetailType'];
      print(data[0]);

      //Displating other page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>GivenDateStatmentResponse(data)),
      );
    }}
    else {
    print(response.reasonPhrase);
    }
  }


}







