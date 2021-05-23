import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coop_mobile/CommonData.dart';
import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/CustomText.dart';
import 'package:coop_mobile/CustomerWidget/AcropPop.dart';

import 'package:coop_mobile/response/AccountDetailResponse.dart';
import 'package:coop_mobile/response/DebitCardRequestResponse.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DebitCardRequest extends StatefulWidget {


  @override
  _DebitCardRequestState createState() => _DebitCardRequestState();
}

class _DebitCardRequestState extends State<DebitCardRequest> {

  final accountNumber=TextEditingController();
  final customerID=TextEditingController();
  final customerTitle=TextEditingController();
  final cardType=TextEditingController();
  final debitCardType=TextEditingController();
  final nameOnCard=TextEditingController();
  final maritalStatus=TextEditingController();
  final gender=TextEditingController();
  final identytNo=TextEditingController();
  final identytytype=TextEditingController();
  final adressType=TextEditingController();
  final adress=TextEditingController();
  final phone=TextEditingController();



  _DebitCardRequestState();
  @override
  Widget build(BuildContext context) {
    String setOperationType(int type){
      setState(() {
        //   operationType=type;
      });
    }
    accountNumber.text=  "1000000067567";
    customerTitle.text='1:MR';
    cardType.text='NEW';
    debitCardType.text="1:ORDINARY DEBIT CARD";
    nameOnCard.text='OROMIA';
    maritalStatus.text="1:Single";
    gender.text="M";
    identytytype.text='1:Civil ID';
    identytNo.text='1002272462';
    adressType.text='01:Mailing Address';
    adress.text='Addis Ababa';
    phone.text='+251911427707';
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Debit Card Request').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: [
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(customerTitle,'Customer Title'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(cardType,'Card Type'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(debitCardType,'Debit Card type'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(nameOnCard,'Name on Card'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(maritalStatus,'Marital Status'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(gender,'Gender'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(identytytype,'Identity Type'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(identytNo,'Identity No'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(adressType,'Adress type'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(adress,'Address'),
                ),
                Container(
                 alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: UserInputTextField(phone,'Phone Number'),
                ),


                Container(
                    child: ElevatedButton(child:Text('Request Debit Card'),onPressed: ()=>miniStatement())
                ),

              ],
            )
        )
    );


  }

  miniStatement() async {
    Methods.showLoaderDialog(context,'Requesting Debit Card...');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://${CommonData.ip}:7080/v1/cbo?id=11'));
    request.body =
    '''
   {
    "DebitCardRequest": {
        "ESBHeader": {
            "serviceCode": "150000",
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
                "FieldContent": "${customerID.text}"
            },
            {
                "FieldName": "CUS.TITLE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${customerTitle.text}"
            },
            {
                "FieldName": "CARD.REQ.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "NEW"
            },
            {
                "FieldName": "DEBIT.CARD.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${debitCardType.text}"
            },
            {
                "FieldName": "NAME.ON.CARD",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${nameOnCard.text}"
            },
            {
                "FieldName": "MARITAL.STATUS",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${maritalStatus.text}"
            },
            {
                "FieldName": "GENDER",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${gender.text}"
            },
            {
                "FieldName": "IDENTITY.NO",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${identytNo.text}"
            },
            {
                "FieldName": "IDENTITY.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${identytytype.text}"
            },
            {
                "FieldName": "ADDRESS.TYPE",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${adressType.text}"
            },
            {
                "FieldName": "ADDRESS",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${adress.text}"
            },
            {
                "FieldName": "PHONE.NO",
                "MultiValueNumber": "1",
                "SubvalueNumber": "1",
                "FieldContent": "${phone.text}"
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
print(val);

      if(data['DebitCardRequestResponse']['ESBStatus']['status']!='Success')
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error Message',
          desc: data['DebitCardRequestResponse']['ESBStatus']['Status'],
          btnCancelOnPress:(){Navigator.pop(context);} ,
        ).show();

else{
       data= data['DebitCardRequestResponse']['ReturnedMessageData'];
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







