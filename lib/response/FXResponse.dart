import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FXResponse extends StatefulWidget {

  var data;
  FXResponse(this.data);
  @override
  _FXResponseState createState() => _FXResponseState(this.data);
}

class _FXResponseState extends State<FXResponse> {
  var _data;
  _FXResponseState(this._data);
  final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'FX Response').buildPreferredSize(),
        body: Container(

          width: double.infinity,
          height: double.infinity,
          child: ListView(children: [
            DataTable(
              dataRowHeight: 90, headingRowHeight: 56.0,
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
                      DataCell(Column(
                        children: [

                          Text('County Code',),
                          Text('CCy Market'),
                          Text('Mid Rate'),
                          Text('BuyRate'),
                          Text('Sell Rate'),
                        ],
                      )),
                      DataCell(Column(
                        children: [
                          Text(_data[x]['Ccy'].toString()),
                          Text(_data[x]['CcyMarket'].toString()),
                          Text(_data[x]['MidRate'].toString()),
                          Text(_data[x]['BuyRate'].toString()),
                          Text(_data[x]['SellRate'].toString()),
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







