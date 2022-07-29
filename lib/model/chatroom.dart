class chatroom{
  String? chatroomid;
  List<String>? participants;

  chatroom({this.chatroomid,this.participants});

  chatroom.fromMap(Map<String,dynamic>map){
    chatroomid = map["chatroomid"];
    participants = map["participants"];
  }
  Map<String,dynamic>toMap(){
    return{
      "chatroomid":chatroomid,
      "participants":participants,
    };
  }
}