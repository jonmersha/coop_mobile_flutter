import 'package:coop_mobile/CustomerWidget/CustomAppBar.dart';
import 'package:coop_mobile/CustomerWidget/custom_color.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FundTransferResponse extends StatefulWidget {

  var data;
  FundTransferResponse(this.data);
  @override
  _FundTransferResponseState createState() => _FundTransferResponseState(this.data);
}

class _FundTransferResponseState extends State<FundTransferResponse> {
  var _data;
  _FundTransferResponseState(this._data);
  final accountNumber=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: APPBarChieledPage("App Connect Test",'Transfer Response').buildPreferredSize(),
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

                 rows: <DataRow>[

                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,

                                  child: Text("ID"))),
                              DataCell(Text(_data['id']))
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("TRANSACTIONTYPE"))),
                              DataCell(Text(_data['TRANSACTIONTYPE']))
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("DEBITACCTNO"))),
                              DataCell(Text(_data['DEBITACCTNO']))
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("DEBITAMOUNT"))),
                              DataCell(Text(_data['DEBITAMOUNT'])),
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("DEBITVALUEDATE"))),
                              DataCell(Text(_data['DEBITVALUEDATE'])),
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(

                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("DEBITTHEIRREF"))),
                              DataCell(Text(_data['DEBITTHEIRREF'])),
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("CREDITTHEIRREF"))),
                              DataCell(Text(_data['CREDITTHEIRREF'])),
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("CREDITACCTNO"))),
                              DataCell(Text(_data['CREDITACCTNO'])),
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(Container(
                                  color: Colors.amberAccent,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Text("CREDITCURRENCY"))),
                              DataCell(Text(_data['CREDITCURRENCY'])),
                   ]),
                   DataRow(cells: <DataCell>[
                              DataCell(
                                  Container(
                                      color: Colors.amberAccent,
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Text("CREDITVALUEDATE"))),
                              DataCell(Text(_data['CREDITVALUEDATE'])),
                   ]),
                 ],
              ),
            ]),
            )
        );
  }

}







