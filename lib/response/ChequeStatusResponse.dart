import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChequeStatusResponse extends StatefulWidget {

  var data;
  var accountNumber;
  var accountName;
  ChequeStatusResponse(this.data, this.accountNumber,this.accountName);
  @override
  _ChequeStatusResponseState createState() => _ChequeStatusResponseState(this.data,this.accountNumber,this.accountName);
}

class _ChequeStatusResponseState extends State<ChequeStatusResponse> {
  var _data;
  String accountNumbers;
  String accountName;
  _ChequeStatusResponseState(this._data,this.accountNumbers,this.accountName);
  //final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Check Book Status Response').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [

              Text('${accountName}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15.0,)),
              Text('${accountNumbers}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15.0)),
              DataTable(
                dataRowHeight: 80, headingRowHeight: 56.0,
                headingRowColor:
                MaterialStateColor.resolveWith((states) => CustomColor.white),
                columnSpacing: 20.0,

                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Value',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0),
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

                            Text('ChequeType',),
                            Text('ChequeNum'),
                            Text('Amount'),
                            Text('PresentedClearedDate'),
                          ],
                        )),
                        DataCell(Column(
                          children: [
                            Text(_data[x]['ChequeType'].toString()),
                            Text(_data[x]['ChequeNum'].toString()),
                            Text(_data[x]['Amount'].toString()),
                            Text(_data[x]['PresentedClearedDate'].toString()),
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







}







