import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChequeBookRequestResponse extends StatefulWidget {

  var data;
  ChequeBookRequestResponse(this.data);
  @override
  _ChequeBookRequestResponseState createState() => _ChequeBookRequestResponseState(this.data);
}

class _ChequeBookRequestResponseState extends State<ChequeBookRequestResponse> {
  var _data;
  _ChequeBookRequestResponseState(this._data);
  final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Cheque Book Request response').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [
              DataTable(
                dataRowHeight: 200, headingRowHeight: 56.0,
                headingRowColor:
                MaterialStateColor.resolveWith((states) => CustomColor.black),
                columnSpacing: 20.0,

                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Value',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0),
                    ),
                  ),


                ],
                // for(int x=0;x<data.length;x++){}
                rows: <DataRow>[

                  for (int x = 0; x < 1; x++)
                    DataRow(

                      color: MaterialStateColor.resolveWith((states) {
                        return x % 2 == 0
                            ? Colors.lightBlue[100]
                            : Colors.lightGreen[50]; //make tha magic!
                      }),
                      cells: <DataCell>[
                        DataCell(Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [


                            Text('id',),
                            Text('CHEQUESTATUS'),
                            Text('CURRENCY'),
                            Text('RECORDSTATUS'),
                            Text('COCODE'),
                          ],
                        )),
                        DataCell(Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Text(_data['CHEQUEISSUEType']['id'].toString()),
                            Text(_data['CHEQUEISSUEType']['CHEQUESTATUS'].toString()),
                            Text(_data['CHEQUEISSUEType']['CURRENCY'].toString()),
                            Text(_data['CHEQUEISSUEType']['RECORDSTATUS'].toString()),
                            Text(_data['CHEQUEISSUEType']['COCODE'].toString()),

                          ],
                        )),

                      ],
                    ),
                ],
              ),
            ]),
            )
        );



  }

  miniStatement(data)  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>TransactionDetailsRequst(data)),
    );

    // print('');
    //
    // var headers = {
    //   'Content-Type': 'application/json'
    // };
    // var request = http.Request('POST', Uri.parse('http://10.1.245.150:7080/v1/cbo/'));
    // request.body = '''{\n    "MiniStatementRequest":{\n    "ESBHeader":{\n    "serviceCode": "100000",\n    "channel":"USSD",\n    "Service_name":"MMTSTMT",\n    "Message_Id":"6255726662"\n},\n"WebRequestCommon": {\n"company": "ET0010222",\n"password": "123456",\n"userName": "REGASAALC"\n},\n"EMMTMINISTMTType": [{\n"columnName": "ACCOUNT",\n"criteriaValue":"1000000067567",\n"operand": "EQ"\n}\n]\n}\n}\n''';
    // request.headers.addAll(headers);
    //
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    // print(response.reasonPhrase);
    // }
  }


}







