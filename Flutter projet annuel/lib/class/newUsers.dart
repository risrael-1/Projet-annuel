class NewUsers {
  final int response;


  NewUsers(this.response) ;

  factory NewUsers.fromJson(Map<String, dynamic> json) {
    return NewUsers(
        json["response"] as int
    );
  }
}