import 'package:coop_mobile/CustomerWidget/Card.dart';
import 'package:coop_mobile/request/FRrateCheck.dart';
import 'package:coop_mobile/request/cheque_book/CheckBookRequest.dart';
import 'package:coop_mobile/request/cheque_book/CheckBookStatusRequest.dart';
import 'package:coop_mobile/request/cheque_book/RevokePaymentCheque.dart';
import 'package:coop_mobile/request/cheque_book/StopPaymentCheque.dart';
import 'package:coop_mobile/request/debit_card/DebitCardBlockUnblockReqeuest.dart';
import 'package:coop_mobile/request/debit_card/DebitCardReplacementReqeuest.dart';
import 'package:coop_mobile/request/debit_card/DebitCardReqeuest.dart';
import 'package:coop_mobile/request/fund_transfer/FundTransferCredit.dart';
import 'package:coop_mobile/request/fund_transfer/FundTransferDebit.dart';
import 'package:coop_mobile/request/fund_transfer/FundTransferInternal.dart';
import 'package:coop_mobile/request/transation_info/AccountDetailRequest.dart';
import 'package:coop_mobile/request/BalanceRequest.dart';
import 'package:coop_mobile/request/transation_info/GivenDateStatmentRequest.dart';
import 'package:coop_mobile/request/transation_info/MiniStatmentRequest.dart';
import 'package:coop_mobile/request/transation_info/TransactionDetailsRequst.dart';

import 'package:flutter/material.dart';



class MainMenu extends StatelessWidget {
  const MainMenu({Key key}) : super(key: key);
  @override
  Widget
  build(BuildContext context) {
        return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          childAspectRatio:(1),
          shrinkWrap: true,
          crossAxisSpacing:.45,
          mainAxisSpacing: 0.1,
          crossAxisCount: orientation == Orientation.portrait ? 4: 8, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.2),
            child: CustomCard(MiniStatment(),"Mini Statement", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(5.2),
            child: CustomCard(GivenDateStatementRequest(),"Given Date STM", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(BalanceRequest(),"Balance Enquiry", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(TransactionDetailsRequst('FT19315M029Y'),"Transaction Detail", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(AccountDetailRequest(),"Account Detail", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),



          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(FundTransferInternal(),"Fund Transfer", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(BulkFundTransferCredit(),"Bulk Credit", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(BulkFundTransferDebit(),"Bulk Debit", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),

          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(DebitCardRequest(),"Debit card Request", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(DebitCardReplacementRequest(),"Debit Card Replacement", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(DebitCardBlockUnblockRequest(),"Debit Card Block", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(CheckBookRequest(),"Cheque Book request", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(StopPaymentCheque(),"Stop Payment Cheque", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(CheckBookStatusRequest(),"ChackBook Status", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(RevokePaymentCheque(),"RevokePayment cheque", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),

          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(FXRateInfromation(),"FX Rate", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),







        ],);
      },
    );
    ;
  }
}
