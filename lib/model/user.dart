class usermodel{
  String? uid;
  String? fullname;
  String? email;
  String? profilePic;

  //default constructor
  usermodel(
    {
        this.uid,
        this.fullname,
        this.email,
        this.profilePic,
    }
  );

  //Serialization

  //from
  usermodel.fromMap(Map<String ,dynamic>map){
    uid = map["uid"];
    fullname = map["fullname"];
    email = map["email"];
    profilePic = map["profilePic"];
  }

  //to
  Map<String,dynamic> toMap(){
    return{
      "uid" : uid,
      "fullname" : fullname,
      "email" : email,
      "profilePic" : profilePic
    };
  }
}