import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';
import 'package:coop_mobile/model/TransationDetailResponseModel.dart';
import 'package:coop_mobile/response/BlalanceResponse.dart';
import 'package:coop_mobile/response/GiveneDateStatementResponse.dart';
import 'package:coop_mobile/response/MiniStatementResponse.dart';
import 'package:coop_mobile/response/TransationDetailResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TransactionDetailsRequst extends StatefulWidget {
  String transationID;

  TransactionDetailsRequst(this.transationID);

  @override
  _TransactionDetailsRequstState createState() => _TransactionDetailsRequstState(this.transationID);
}

class _TransactionDetailsRequstState extends State<TransactionDetailsRequst> {
  String transationID;

  final transactionRefernce=TextEditingController();
  final givenDat=TextEditingController();

  _TransactionDetailsRequstState(this.transationID);
  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }
    transactionRefernce.text=  transationID;
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Transaction Details Request').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(transactionRefernce,'Transaction Reference'),
                ),

                Container(
                    child: ElevatedButton(child:Text('Transaction Detail'),onPressed: ()=>miniStatement())
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
    request.body = '''{\n"GetTransactionDetailsRequest": {\n"ESBHeader": {\n"serviceCode": "400000",\n"channel": "USSD",\n"Service_name": "MMTFTVIEW ",\n"Message_Id": "6254426662"\n},\n\n"WebRequestCommon": {\n"company": "ET0010222",\n"password": "123456",\n"userName": "REGASAALC"\n},\n"EMMTTXNFTType": [\n{\n"columnName": "TRANSACTION.ID",\n"criteriaValue": "${transactionRefernce.text}",\n"operand": "EQ"\n}\n]\n}\n}\n''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
      String val=await response.stream.bytesToString();
     // print(val);
      var data=convert.jsonDecode(val);




       //print(data['GetTransactionDetailsResponse']['ESBStatus']);

      if(data['GetTransactionDetailsResponse']['ESBStatus']['Status']=='Failure')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: response.statusCode.toString(),
          desc: data['GetTransactionDetailsResponse']['ESBStatus']['errorDescription'][1],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
       data= data['GetTransactionDetailsResponse']['MMTFTVIEWResponse']['EMMTTXNFTType'][0]['gEMMTTXNFTDetailType']['mEMMTTXNFTDetailType'];
    //  print(data);

    //  Displating other page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>TransationDetailResponse(data)),
      );
    }

    }
    else {
    print(response.reasonPhrase);
    }
  }
}







