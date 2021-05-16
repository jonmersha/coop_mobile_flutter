// class TransactionDetailObject {
//   GetTransactionDetailsResponse getTransactionDetailsResponse;
//   TransactionDetailObject({this.getTransactionDetailsResponse});
//
//   TransactionDetailObject.fromJson(Map<String, dynamic> json) {
//     getTransactionDetailsResponse =
//     json['GetTransactionDetailsResponse'] != null
//         ? new GetTransactionDetailsResponse.fromJson(
//         json['GetTransactionDetailsResponse'])
//         : null;
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     if (this.getTransactionDetailsResponse != null) {
//       data['GetTransactionDetailsResponse'] =
//           this.getTransactionDetailsResponse.toJson() as String;
//     }
//     return data;
//   }
// }
//
// class GetTransactionDetailsResponse {
//   ESBHeader eSBHeader;
//   Status status;
//   MMTFTVIEWResponse mMTFTVIEWResponse;
//   ESBStatus eSBStatus;
//
//   GetTransactionDetailsResponse(
//       {this.eSBHeader, this.status, this.mMTFTVIEWResponse, this.eSBStatus});
//
//   GetTransactionDetailsResponse.fromJson(Map<String, String> json) {
//     eSBHeader = json['ESBHeader'] != null
//         ? new ESBHeader.fromJson(json['ESBHeader'])
//         : null;
//     status =
//     json['Status'] != null ? new Status.fromJson(json['Status']) : null;
//     mMTFTVIEWResponse = json['MMTFTVIEWResponse'] != null
//         ? new MMTFTVIEWResponse.fromJson(json['MMTFTVIEWResponse'])
//         : null;
//     eSBStatus = json['ESBStatus'] != null
//         ? new ESBStatus.fromJson(json['ESBStatus'])
//         : null;
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     if (this.eSBHeader != null) {
//       data['ESBHeader'] = this.eSBHeader.toJson() as String;
//     }
//     if (this.status != null) {
//       data['Status'] = this.status.toJson() as String;
//     }
//     if (this.mMTFTVIEWResponse != null) {
//       data['MMTFTVIEWResponse'] = this.mMTFTVIEWResponse.toJson() as String;
//     }
//     if (this.eSBStatus != null) {
//       data['ESBStatus'] = this.eSBStatus.toJson() as String;
//     }
//     return data;
//   }
// }
//
// class ESBHeader {
//   String serviceCode;
//   String channel;
//   String serviceName;
//   String messageId;
//
//   ESBHeader({this.serviceCode, this.channel, this.serviceName, this.messageId});
//
//   ESBHeader.fromJson(Map<String, String> json) {
//     serviceCode = json['serviceCode'];
//     channel = json['channel'];
//     serviceName = json['Service_name'];
//     messageId = json['Message_Id'];
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     data['serviceCode'] = this.serviceCode;
//     data['channel'] = this.channel;
//     data['Service_name'] = this.serviceName;
//     data['Message_Id'] = this.messageId;
//     return data;
//   }
// }
//
// class Status {
//   String successIndicator;
//
//   Status({this.successIndicator});
//
//   Status.fromJson(Map<String, String> json) {
//     successIndicator = json['successIndicator'];
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     data['successIndicator'] = this.successIndicator;
//     return data;
//   }
// }
//
// class MMTFTVIEWResponse {
//   List<EMMTTXNFTType> eMMTTXNFTType;
//
//   MMTFTVIEWResponse({this.eMMTTXNFTType});
//
//   MMTFTVIEWResponse.fromJson(Map<String, String> json) {
//     if (json['EMMTTXNFTType'] != null) {
//       eMMTTXNFTType = new List<EMMTTXNFTType>();
//       json['EMMTTXNFTType'].forEach((v) {
//         eMMTTXNFTType.add(new EMMTTXNFTType.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     if (this.eMMTTXNFTType != null) {
//       data['EMMTTXNFTType'] =
//           this.eMMTTXNFTType.map((v) => v.toJson()) as String.toList();
//     }
//     return data;
//   }
// }
//
// class EMMTTXNFTType {
//   GEMMTTXNFTDetailType gEMMTTXNFTDetailType;
//
//   EMMTTXNFTType({this.gEMMTTXNFTDetailType});
//
//   EMMTTXNFTType.fromJson(Map<String, String> json) {
//     gEMMTTXNFTDetailType = json['gEMMTTXNFTDetailType'] != null
//         ? new GEMMTTXNFTDetailType.fromJson(json['gEMMTTXNFTDetailType'])
//         : null;
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     if (this.gEMMTTXNFTDetailType != null) {
//       data['gEMMTTXNFTDetailType'] = this.gEMMTTXNFTDetailType.toJson() as String;
//     }
//     return data;
//   }
// }
//
// class GEMMTTXNFTDetailType {
//   MEMMTTXNFTDetailType mEMMTTXNFTDetailType;
//
//   GEMMTTXNFTDetailType({this.mEMMTTXNFTDetailType});
//
//   GEMMTTXNFTDetailType.fromJson(Map<String, String> json) {
//     mEMMTTXNFTDetailType = json['mEMMTTXNFTDetailType'] != null
//         ? new MEMMTTXNFTDetailType.fromJson(json['mEMMTTXNFTDetailType'])
//         : null;
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     if (this.mEMMTTXNFTDetailType != null) {
//       data['mEMMTTXNFTDetailType'] = this.mEMMTTXNFTDetailType.toJson() as String;
//     }
//     return data;
//   }
// }
//
// class MEMMTTXNFTDetailType {
//   String dEBITACCOUNT;
//   String cREDITACCOUNT;
//   String aMOUNT;
//   String cURRENCY;
//   String fTREFERENCE;
//   String dATE;
//
//   MEMMTTXNFTDetailType(
//       {this.dEBITACCOUNT,
//         this.cREDITACCOUNT,
//         this.aMOUNT,
//         this.cURRENCY,
//         this.fTREFERENCE,
//         this.dATE});
//
//   MEMMTTXNFTDetailType.fromJson(Map<String, String> json) {
//     dEBITACCOUNT = json['DEBITACCOUNT'];
//     cREDITACCOUNT = json['CREDITACCOUNT'];
//     aMOUNT = json['AMOUNT'];
//     cURRENCY = json['CURRENCY'];
//     fTREFERENCE = json['FTREFERENCE'];
//     dATE = json['DATE'];
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     data['DEBITACCOUNT'] = this.dEBITACCOUNT;
//     data['CREDITACCOUNT'] = this.cREDITACCOUNT;
//     data['AMOUNT'] = this.aMOUNT;
//     data['CURRENCY'] = this.cURRENCY;
//     data['FTREFERENCE'] = this.fTREFERENCE;
//     data['DATE'] = this.dATE;
//     return data;
//   }
// }
//
// class ESBStatus {
//   String status;
//   String responseCode;
//
//   ESBStatus({this.status, this.responseCode});
//
//   ESBStatus.fromJson(Map<String, String> json) {
//     status = json['Status'];
//     responseCode = json['responseCode'];
//   }
//
//   Map<String, String> toJson() {
//     final Map<String, String> data = new Map<String, String>();
//     data['Status'] = this.status;
//     data['responseCode'] = this.responseCode;
//     return data;
//   }
// }
