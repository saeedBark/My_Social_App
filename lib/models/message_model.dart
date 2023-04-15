class MessageModel {
  String? sendId;
  String? receiveId;
  String? textMessage;
  String? dateTime;

  MessageModel(
      {this.sendId,
        this.receiveId,
        this.textMessage,
        this.dateTime,
        });
  MessageModel.formJson(Map<String, dynamic> json) {
    sendId = json['sendId'];
    receiveId = json['receiveId'];
    textMessage = json['textMessage'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'sendId': sendId,
      'receiveId': receiveId,
      'textMessage': textMessage,
      'dateTime': dateTime,

    };
  }
}
