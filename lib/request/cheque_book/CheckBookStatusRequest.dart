import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CheckBookStatusRequest extends StatefulWidget {


  @override
  _CheckBookStatusRequestState createState() => _CheckBookStatusRequestState();
}

class _CheckBookStatusRequestState extends State<CheckBookStatusRequest> {


  final accountNumber=TextEditingController();


  _CheckBookStatusRequestState();
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
        appBar: APPBarChieledPage("App Connect Test",'ChequeBook Status').buildPreferredSize(),
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
                    child: ElevatedButton(child:Text('Get Status'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'Check Book Status...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.1.245.150:7080/v1/cbo/'));
    request.body = '''
    
    {
    "ChequeBookStatusRequest": {
        "ESBHeader": {
            "serviceCode": "140000",
            "channel": "USSD",
            "Service_name": "CHEQUESTATUS",
            "Message_Id": "6255726662"
        },
        "WebRequestCommon": {
            "company": "ET0010222",
            "password": "123456",
            "userName": "REGASAALC"
        },
        "CHQPRESENTEDWSType": [
            {
                "columnName": "@ID",
                "criteriaValue": "1000000000028",
                "operand": "CT"
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







