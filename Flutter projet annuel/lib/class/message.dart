class Message {

  final String response;

  Message(this.response);


  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        json["response"]
    );
  }
}