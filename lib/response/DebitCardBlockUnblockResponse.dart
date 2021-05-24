import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DebitCardBlockUnblockResponse extends StatefulWidget {

  var data;

  DebitCardBlockUnblockResponse(this.data);
  @override
  _DebitCardBlockUnblockResponseState createState() => _DebitCardBlockUnblockResponseState(this.data);
}

class _DebitCardBlockUnblockResponseState extends State<DebitCardBlockUnblockResponse> {
  var _data;

  _DebitCardBlockUnblockResponseState(this._data);
  //final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Debit card Block unblock Response').buildPreferredSize(),
        body: Container(

            width: double.infinity,
            height: double.infinity,
            child: ListView(children: [


              DataTable(
               // dataRowHeight: 80, headingRowHeight: 56.0,
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
                        DataCell(Text(_data[x]['FieldName'].toString())),
                        DataCell(Text(_data[x]['FieldContent'].toString())),

                      ],
                    ),
                ],
              ),
            ]),
            )
        );



  }







}







