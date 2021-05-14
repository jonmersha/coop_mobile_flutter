class AccountStatementForAGivenDateRSP {
  AccountStatementForAGivenDateResponse accountStatementForAGivenDateResponse;

  AccountStatementForAGivenDateRSP(
      {this.accountStatementForAGivenDateResponse});

  AccountStatementForAGivenDateRSP.fromJson(Map<String, dynamic> json) {
    accountStatementForAGivenDateResponse =
    json['AccountStatementForAGivenDateResponse'] != null
        ? new AccountStatementForAGivenDateResponse.fromJson(
        json['AccountStatementForAGivenDateResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accountStatementForAGivenDateResponse != null) {
      data['AccountStatementForAGivenDateResponse'] =
          this.accountStatementForAGivenDateResponse.toJson();
    }
    return data;
  }
}

class AccountStatementForAGivenDateResponse {
  ESBHeader eSBHeader;
  Status status;
  EMMTMINISTMTDATEType eMMTMINISTMTDATEType;
  ESBStatus eSBStatus;

  AccountStatementForAGivenDateResponse(
      {this.eSBHeader, this.status, this.eMMTMINISTMTDATEType, this.eSBStatus});

  AccountStatementForAGivenDateResponse.fromJson(Map<String, dynamic> json) {
    eSBHeader = json['ESBHeader'] != null
        ? new ESBHeader.fromJson(json['ESBHeader'])
        : null;
    status =
    json['Status'] != null ? new Status.fromJson(json['Status']) : null;
    eMMTMINISTMTDATEType = json['EMMTMINISTMTDATEType'] != null
        ? new EMMTMINISTMTDATEType.fromJson(json['EMMTMINISTMTDATEType'])
        : null;
    eSBStatus = json['ESBStatus'] != null
        ? new ESBStatus.fromJson(json['ESBStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eSBHeader != null) {
      data['ESBHeader'] = this.eSBHeader.toJson();
    }
    if (this.status != null) {
      data['Status'] = this.status.toJson();
    }
    if (this.eMMTMINISTMTDATEType != null) {
      data['EMMTMINISTMTDATEType'] = this.eMMTMINISTMTDATEType.toJson();
    }
    if (this.eSBStatus != null) {
      data['ESBStatus'] = this.eSBStatus.toJson();
    }
    return data;
  }
}

class ESBHeader {
  String serviceCode;
  String channel;
  String serviceName;
  String messageId;

  ESBHeader({this.serviceCode, this.channel, this.serviceName, this.messageId});

  ESBHeader.fromJson(Map<String, dynamic> json) {
    serviceCode = json['serviceCode'];
    channel = json['channel'];
    serviceName = json['Service_name'];
    messageId = json['Message_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceCode'] = this.serviceCode;
    data['channel'] = this.channel;
    data['Service_name'] = this.serviceName;
    data['Message_Id'] = this.messageId;
    return data;
  }
}

class Status {
  String successIndicator;

  Status({this.successIndicator});

  Status.fromJson(Map<String, dynamic> json) {
    successIndicator = json['successIndicator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['successIndicator'] = this.successIndicator;
    return data;
  }
}

class EMMTMINISTMTDATEType {
  GEMMTMINISTMTDATEDetailType gEMMTMINISTMTDATEDetailType;

  EMMTMINISTMTDATEType({this.gEMMTMINISTMTDATEDetailType});

  EMMTMINISTMTDATEType.fromJson(Map<String, dynamic> json) {
    gEMMTMINISTMTDATEDetailType = json['gEMMTMINISTMTDATEDetailType'] != null
        ? new GEMMTMINISTMTDATEDetailType.fromJson(
        json['gEMMTMINISTMTDATEDetailType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gEMMTMINISTMTDATEDetailType != null) {
      data['gEMMTMINISTMTDATEDetailType'] =
          this.gEMMTMINISTMTDATEDetailType.toJson();
    }
    return data;
  }
}

class GEMMTMINISTMTDATEDetailType {
  List<MEMMTMINISTMTDATEDetailType> mEMMTMINISTMTDATEDetailType;

  GEMMTMINISTMTDATEDetailType({this.mEMMTMINISTMTDATEDetailType});

  GEMMTMINISTMTDATEDetailType.fromJson(Map<String, dynamic> json) {
    if (json['mEMMTMINISTMTDATEDetailType'] != null) {
      mEMMTMINISTMTDATEDetailType = new List<MEMMTMINISTMTDATEDetailType>();
      json['mEMMTMINISTMTDATEDetailType'].forEach((v) {
        mEMMTMINISTMTDATEDetailType
            .add(new MEMMTMINISTMTDATEDetailType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mEMMTMINISTMTDATEDetailType != null) {
      data['mEMMTMINISTMTDATEDetailType'] =
          this.mEMMTMINISTMTDATEDetailType.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MEMMTMINISTMTDATEDetailType {
  SelFldACCOUNT selFldACCOUNT;
  SelFldACCOUNT selFldBOOKINGDATE;
  SelFldACCOUNT selFldNOOFRECS;
  String tXNREF;
  String cRAMT;
  String dRAMT;
  String dATE;
  String dESC;
  String bALANCE;

  MEMMTMINISTMTDATEDetailType(
      {this.selFldACCOUNT,
        this.selFldBOOKINGDATE,
        this.selFldNOOFRECS,
        this.tXNREF,
        this.cRAMT,
        this.dRAMT,
        this.dATE,
        this.dESC,
        this.bALANCE});

  MEMMTMINISTMTDATEDetailType.fromJson(Map<String, dynamic> json) {
    selFldACCOUNT = json['selFldACCOUNT'] != null
        ? new SelFldACCOUNT.fromJson(json['selFldACCOUNT'])
        : null;
    selFldBOOKINGDATE = json['selFldBOOKINGDATE'] != null
        ? new SelFldACCOUNT.fromJson(json['selFldBOOKINGDATE'])
        : null;
    selFldNOOFRECS = json['selFldNOOFRECS'] != null
        ? new SelFldACCOUNT.fromJson(json['selFldNOOFRECS'])
        : null;
    tXNREF = json['TXNREF'];
    cRAMT = json['CRAMT'];
    dRAMT = json['DRAMT'];
    dATE = json['DATE'];
    dESC = json['DESC'];
    bALANCE = json['BALANCE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selFldACCOUNT != null) {
      data['selFldACCOUNT'] = this.selFldACCOUNT.toJson();
    }
    if (this.selFldBOOKINGDATE != null) {
      data['selFldBOOKINGDATE'] = this.selFldBOOKINGDATE.toJson();
    }
    if (this.selFldNOOFRECS != null) {
      data['selFldNOOFRECS'] = this.selFldNOOFRECS.toJson();
    }
    data['TXNREF'] = this.tXNREF;
    data['CRAMT'] = this.cRAMT;
    data['DRAMT'] = this.dRAMT;
    data['DATE'] = this.dATE;
    data['DESC'] = this.dESC;
    data['BALANCE'] = this.bALANCE;
    return data;
  }
}

class SelFldACCOUNT {
  String xsi;
  String nil;

  SelFldACCOUNT({this.xsi, this.nil});

  SelFldACCOUNT.fromJson(Map<String, dynamic> json) {
    xsi = json['xsi'];
    nil = json['nil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xsi'] = this.xsi;
    data['nil'] = this.nil;
    return data;
  }
}

class ESBStatus {
  String status;
  String responseCode;

  ESBStatus({this.status, this.responseCode});

  ESBStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    return data;
  }
}
