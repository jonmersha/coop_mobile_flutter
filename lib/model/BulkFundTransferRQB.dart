class BulkFundTransferRQB {
  BulkFundTransferRequest bulkFundTransferRequest;

  BulkFundTransferRQB({this.bulkFundTransferRequest});

  BulkFundTransferRQB.fromJson(Map<String, dynamic> json) {
    bulkFundTransferRequest = json['BulkFundTransferRequest'] != null
        ? new BulkFundTransferRequest.fromJson(json['BulkFundTransferRequest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bulkFundTransferRequest != null) {
      data['BulkFundTransferRequest'] = this.bulkFundTransferRequest.toJson();
    }
    return data;
  }
}




class BulkFundTransferRequest {
  ESBHeader eSBHeader;
  String applicationName;
  Options options;
  UserInformation userInformation;
  List<MessageData> messageData;

  BulkFundTransferRequest(
      {this.eSBHeader,
        this.applicationName,
        this.options,
        this.userInformation,
        this.messageData});

  BulkFundTransferRequest.fromJson(Map<String, dynamic> json) {
    eSBHeader = json['ESBHeader'] != null
        ? new ESBHeader.fromJson(json['ESBHeader'])
        : null;
    applicationName = json['ApplicationName'];
    options =
    json['Options'] != null ? new Options.fromJson(json['Options']) : null;
    userInformation = json['UserInformation'] != null
        ? new UserInformation.fromJson(json['UserInformation'])
        : null;
    if (json['MessageData'] != null) {
      messageData = new List<MessageData>();
      json['MessageData'].forEach((v) {
        messageData.add(new MessageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eSBHeader != null) {
      data['ESBHeader'] = this.eSBHeader.toJson();
    }
    data['ApplicationName'] = this.applicationName;
    if (this.options != null) {
      data['Options'] = this.options.toJson();
    }
    if (this.userInformation != null) {
      data['UserInformation'] = this.userInformation.toJson();
    }
    if (this.messageData != null) {
      data['MessageData'] = this.messageData.map((v) => v.toJson()).toList();
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

class Options {
  String versionName;
  String function;
  String operation;

  Options({this.versionName, this.function, this.operation});

  Options.fromJson(Map<String, dynamic> json) {
    versionName = json['VersionName'];
    function = json['Function'];
    operation = json['Operation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VersionName'] = this.versionName;
    data['Function'] = this.function;
    data['Operation'] = this.operation;
    return data;
  }
}

class UserInformation {
  String userId;
  String passWord;
  String companyID;

  UserInformation({this.userId, this.passWord, this.companyID});

  UserInformation.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    passWord = json['PassWord'];
    companyID = json['CompanyID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['PassWord'] = this.passWord;
    data['CompanyID'] = this.companyID;
    return data;
  }
}

class MessageData {
  String fieldName;
  String multiValueNumber;
  String subvalueNumber;
  String fieldContent;

  MessageData(
      {this.fieldName,
        this.multiValueNumber,
        this.subvalueNumber,
        this.fieldContent});

  MessageData.fromJson(Map<String, dynamic> json) {
    fieldName = json['FieldName'];
    multiValueNumber = json['MultiValueNumber'];
    subvalueNumber = json['SubvalueNumber'];
    fieldContent = json['FieldContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FieldName'] = this.fieldName;
    data['MultiValueNumber'] = this.multiValueNumber;
    data['SubvalueNumber'] = this.subvalueNumber;
    data['FieldContent'] = this.fieldContent;
    return data;
  }
}
