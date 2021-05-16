import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiniStatementResponse extends StatefulWidget {

  var data;
  MiniStatementResponse(this.data);
  @override
  _MiniStatementResponseState createState() => _MiniStatementResponseState(this.data);
}

class _MiniStatementResponseState extends State<MiniStatementResponse> {
  var _data;
  _MiniStatementResponseState(this._data);
  final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'MiniStatement result').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [
              DataTable(
                headingRowColor:
                MaterialStateColor.resolveWith((states) => CustomColor.black),
                columnSpacing: 10.0,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'No',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Tr_Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Reference',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Desc',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Amount',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'detail',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10.0),
                    ),
                  ),

                ],
                // for(int x=0;x<data.length;x++){}
                rows: <DataRow>[
                  for (int x = 0; x < _data.length; x++)
                    DataRow(
                      color: MaterialStateColor.resolveWith((states) {
                        return x % 2 == 0
                            ? Colors.lightBlue[100]
                            : Colors.lightGreen[50]; //make tha magic!
                      }),
                      cells: <DataCell>[
                        DataCell(Text((x+1).toString())),
                        DataCell(Text(_data[x]['DATE'].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 8.0))),
                        DataCell(
                            Text(
                                _data[x]['TXNREF'].toString().substring(0,12),
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 8.0)
                        )),

                         DataCell(Text(_data[x]['DESC'].toString(),style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                             fontSize: 8.0))),
                        DataCell(Text(_data[x]['DRAMT'].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 8.0))),
                        DataCell(ElevatedButton(child: Text('See_detail',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12.0)),onPressed: (){miniStatement(_data[x]['TXNREF'].toString().substring(0,12));},)),

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







