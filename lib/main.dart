import 'package:coop_mobile/AccountStatementForAGivenDateRSP.dart';
import 'package:coop_mobile/GivenDateStatement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'custom_color.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coop Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Coop Mobile'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //var dataList;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {

     //dataList= getTransactionList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:FutureBuilder(
          future: customerList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            } else {
              return CircularProgressIndicator();
            }
          })

    );
  }


  //  dataTable()   async {
  //
  //    var headers = {
  //      'Content-Type': 'application/json'
  //    };
  //    var request = http.Request('GET', Uri.parse('http://192.168.83.203:3000/'));
  //    request.body = '''{"name":"yohannes"}''';
  //    request.headers.addAll(headers);
  //    http.StreamedResponse response = await request.send();
  //
  //    if (response.statusCode == 200) {
  //
  //      String data=await response.stream.bytesToString();
  //      var val=convert.jsonDecode(data.toString());
  //
  //      var   dataList= val['AccountStatementForAGivenDateResponse']['EMMTMINISTMTDATEType']['gEMMTMINISTMTDATEDetailType']['mEMMTMINISTMTDATEDetailType'];
  //
  //      // statmentList;
  //
  //
  //      return ListView(
  //          children: [
  //            DataTable(
  //              headingRowColor:
  //              MaterialStateColor.resolveWith((states) => Colors.black),
  //              columnSpacing: 10.0,
  //              columns: <DataColumn>[
  //                DataColumn(
  //                  label: Text(
  //                    'FT Id',
  //                    style: TextStyle(
  //                        fontWeight: FontWeight.bold,
  //                        color: Colors.white,
  //                        fontSize: 15.0),
  //                  ),
  //                ),
  //                DataColumn(
  //                  label: Text(
  //                    'Date',
  //                    style: TextStyle(
  //                        fontWeight: FontWeight.bold,
  //                        color: Colors.white,
  //                        fontSize: 12.0),
  //                  ),
  //                ),
  //                DataColumn(
  //                  label: Text(
  //                    'Transaction Description',
  //                    style: TextStyle(
  //                        fontWeight: FontWeight.bold,
  //                        color: Colors.white,
  //                        fontSize: 12.0),
  //                  ),
  //                ),
  //                DataColumn(
  //                  label: Text(
  //                    'balance',
  //                    style: TextStyle(
  //                        fontWeight: FontWeight.bold,
  //                        color: Colors.white,
  //                        fontSize: 12.0),
  //                  ),
  //                ),
  //                DataColumn(
  //                  label: Text(
  //                    'More Action',
  //                    style: TextStyle(
  //                        fontWeight: FontWeight.bold,
  //                        color: Colors.white,
  //                        fontSize: 12.0),
  //                  ),
  //                ),
  //              ],
  //
  //
  //
  //
  //              rows: <DataRow>[
  //                for (int x = 0; x < 30; x++)
  //                  DataRow(color: MaterialStateColor.resolveWith((states) {
  //                    return x % 2 == 0
  //                        ? Colors.lightBlue[100]
  //                        : Colors.lightGreen[50]; //make tha magic!
  //                  }),
  //                    cells: <DataCell>[
  //                      DataCell(Text(dataList[x]["TXNREF"].toString())),
  //                      DataCell(Text(dataList[x]["DATE"].toString())),
  //                      DataCell(Text(dataList[x]["DESC"].toString())),
  //                      DataCell(Text(dataList[x]["BALANCE"].toString())),
  //                      DataCell(
  //                          ElevatedButton(
  //                            style:
  //                            ElevatedButton.styleFrom(
  //                                shadowColor: Colors.black,
  //                                primary: CustomColor.cyan_blue,
  //                                elevation: 2
  //                            ),
  //                            child: Text('More-Action'),
  //                            //onPressed: ()=>moreDetail(data[x]),
  //                          ))
  //                    ],
  //                  ),
  //              ],
  //            ),
  //          ]);
  //
  //    }
  //
  //
  // }
   getTransactionList() async {
   // var statmentList;
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://192.168.83.203:3000/'));
    request.body = '''{"name":"yohannes"}''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String data=await response.stream.bytesToString();
      var val=convert.jsonDecode(data.toString());

      var   statmentList= val['AccountStatementForAGivenDateResponse']['EMMTMINISTMTDATEType']['gEMMTMINISTMTDATEDetailType']['mEMMTMINISTMTDATEDetailType'];

      statmentList;

    }

  }


  customerList() async {
    final http.Response response = await http.get(
      Uri.parse('http://192.168.83.203:3000/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(<String, String>{"accountCreator": "yohannes"}),
    );
    if (response.statusCode == 200) {
      var val = convert.jsonDecode(response.body);
      var list = val['AccountStatementForAGivenDateResponse']['EMMTMINISTMTDATEType']['gEMMTMINISTMTDATEDetailType']['mEMMTMINISTMTDATEDetailType'];

      return dataTable(list);
    }
  }



  dataTable(data) {
    print("mamon");
    return Center(
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
                'Date',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0),
              ),
            ),
            DataColumn(
              label: Text(
                'Transaction ID',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0),
              ),
            ),
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
                'balance',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0),
              ),
            ),

          ],
          // for(int x=0;x<data.length;x++){}
          rows: <DataRow>[
            for (int x = 0; x < data.length; x++)
              DataRow(
                color: MaterialStateColor.resolveWith((states) {
                  return x % 2 == 0
                      ? Colors.lightBlue[100]
                      : Colors.lightGreen[50]; //make tha magic!
                }),
                cells: <DataCell>[
                  DataCell(Text((x+1).toString())),
                  DataCell(Text(data[x]['DATE'].toString())),
                  DataCell(Text(data[x]['TXNREF'].toString().substring(0,12))),
                  DataCell(Text(data[x]['DESC'].toString())),
                  DataCell(Text(data[x]['BALANCE'].toString())),

                ],
              ),
          ],
        ),
      ]),
    );


  }


}
