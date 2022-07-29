import 'dart:ffi';

class massage{
  String? sender;
  String? text;
  Bool? seen;
  DateTime? created;

  massage({this.sender,this.text,this.seen,this.created});

  massage.fromMap(Map<String,dynamic>map){
    sender = map["sender"];
    text = map["text"];
    seen = map["seen"];
    created = map["sender"].toDate();
  }

  Map<String,dynamic>toMap(){
    return{
      "sender" : sender,
      "text" : text,
      "seen" : seen,
      "created" : created,
    };
  }
}