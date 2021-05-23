import 'package:coop_mobile/CustomerWidget/Card.dart';
import 'package:coop_mobile/request/FRrateCheck.dart';
import 'package:coop_mobile/request/cheque_book/CheckBookRequest.dart';
import 'package:coop_mobile/request/cheque_book/CheckBookStatus.dart';
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
          childAspectRatio:(1.5),
          shrinkWrap: true,
          crossAxisSpacing:.0,
          mainAxisSpacing: 0.0,
          crossAxisCount: orientation == Orientation.portrait ? 2: 4, children: <Widget>[
         // 1. Mini Statment
          Padding(
            padding: const EdgeInsets.all(5.2),
            child: CustomCard(MiniStatment(),"Mini Statement", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
         // 2. given Date Statement
          Padding(
            padding: const EdgeInsets.all(5.2),
            child: CustomCard(GivenDateStatementRequest(),"Given Date STM", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 3. Balance request
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(BalanceRequest(),"Balance Enquiry", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 4. Transaction Detail
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(TransactionDetailsRequst('FT19315M029Y'),"Transaction Detail", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
         // 5.  Account Detail
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(AccountDetailRequest(),"Account Detail", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 6. Fund transfer
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(FundTransferInternal(),"Fund Transfer", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
         // 7. Bulk Credit
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(BulkFundTransferCredit(),"Bulk Credit", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
         // 8. Bulk Debit
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(BulkFundTransferDebit(),"Bulk Debit", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 9. CheckBook Status
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(CheckBookStatus(),"Cheque Book Status", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 10. CheckBook Request
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(CheckBookRequest(),"Cheque Book request", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 11. Debit Card Request
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(DebitCardRequest(),"Debit card Request", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),//Debit Card request
          // 12. Debit Card Replacement
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(DebitCardReplacementRequest(),"Debit Card Replacement", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 13 Debit Card Block
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(DebitCardBlockUnblockRequest(),"Debit Card Block", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 14. FX Rate
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(FXRateInfromation(),"FX Rate", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 15. Stop Payment
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(StopPaymentCheque(),"Stop Payment Cheque", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),
          // 16. Revoke Payment
          Padding(
            padding: const EdgeInsets.all(10.2),
            child: CustomCard(RevokePaymentCheque(),"RevokePayment cheque", "Various Reports",Colors.white,Colors.black,
                Icon(Icons.featured_play_list),30.0),
          ),

        ],);
      },
    );
    ;
  }
}
