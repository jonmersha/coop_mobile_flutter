import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'custom_color.dart';


class CustomerList extends StatefulWidget {
  @override
  _RecentTransaction createState() => _RecentTransaction();
}

class _RecentTransaction extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );

      FutureBuilder(
        future: customerList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else {
            return CircularProgressIndicator();
          }
        });
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
      var list=val['AccountStatementForAGivenDateResponse']['EMMTMINISTMTDATEType']['gEMMTMINISTMTDATEDetailType']['mEMMTMINISTMTDATEDetailType'];

      //return dataTable(val['AccountStatementForAGivenDateResponse']['EMMTMINISTMTDATEType']['gEMMTMINISTMTDATEDetailType']['mEMMTMINISTMTDATEDetailType']);
    }
  }

  dataTable() {
    print("mamon");
    // return ListView(children: [
    //   DataTable(
    //     headingRowColor:
    //     MaterialStateColor.resolveWith((states) => CustomColor.black),
    //     columnSpacing: 10.0,
    //     columns: <DataColumn>[
    //       DataColumn(
    //         label: Text(
    //           'Ft',
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white,
    //               fontSize: 15.0),
    //         ),
    //       ),
    //
    //
    //
    //
    //     ],
    //     // for(int x=0;x<data.length;x++){}
    //     rows: <DataRow>[
    //       for (int x = 0; x < data.length; x++)
    //         DataRow(
    //           color: MaterialStateColor.resolveWith((states) {
    //             return x % 2 == 0
    //                 ? Colors.lightBlue[100]
    //                 : Colors.lightGreen[50]; //make tha magic!
    //           }),
    //           cells: <DataCell>[
    //             DataCell(Text("Data")),
    //            // DataCell(Text(data[x]["firstName"].toString()+'-'+data[x]["middleName"].toString())),
    //            //  DataCell(
    //            //      ElevatedButton(
    //            //        style:
    //            //        ElevatedButton.styleFrom(
    //            //            shadowColor: Colors.black,
    //            //            primary: CustomColor.cyan_blue,
    //            //            elevation: 2
    //            //        ),
    //            //        child: Text('More-Action'),
    //            //        onPressed: ()=>moreDetail(data[x]),
    //            //      ))
    //           ],
    //         ),
    //     ],
    //   ),
    // ]);

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }

  moreDetail(data) {
    // Navigator.push(
    //   context,
    //  // MaterialPageRoute(builder: (context)=>new CustomerDetailInformation(data)),
    // );

  }

}


