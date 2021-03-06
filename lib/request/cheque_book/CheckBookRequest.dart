import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CommonData.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/model/TransationDetailResponseModel.dart';
import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/BlalanceResponse.dart';
import 'package:coop_mobile/response/ChequeBookRequestResponse.dart';
import 'package:coop_mobile/response/GiveneDateStatementResponse.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:coop_mobile/response/TransationDetailResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CheckBookRequest extends StatefulWidget {


  @override
  _CheckBookRequestState createState() => _CheckBookRequestState();
}

class _CheckBookRequestState extends State<CheckBookRequest> {


  final accountNumber=TextEditingController();


  _CheckBookRequestState();
  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }
    accountNumber.text=  "1000012770662";
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Cheque Book Request').buildPreferredSize(),
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
                    child: ElevatedButton(child:Text('Cheque Book Request'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'chequebook...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://${CommonData.ip}:7080/v1/cbo?id=10'));
    request.body = '''{
    {
    "CHEQUEBOOKREQUEST": {
        "ESBHeader": {
            "serviceCode": "130000",
            "channel": "USSD",
            "Service_name": "CHEQUEBOOKREQUEST",
            "Message_Id": "6255726662"
        },
        "WebRequestCommon": {
            "company": "ET0010107",
            "password": "MMT123",
            "userName": "MMTUSER1"
        },
        "CHEQUEISSUEINPUTCBOWSType": {
            "id": "CABA.${accountNumber.text}",
            "ChequeStatusInput90": "50"
        }
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


      if(data['CHEQUEBOOKREQUESTResponse']['ESBStatus']['Status']=='Failure')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: data['AccountDetailsResponse']['ESBStatus']['errorDescription'][0],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
       data= data['CHEQUEBOOKREQUESTResponse'];
       print(data);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>ChequeBookRequestResponse(data)),
      );
    }

    }
    else {
    print(response.reasonPhrase);
    }
  }
}







