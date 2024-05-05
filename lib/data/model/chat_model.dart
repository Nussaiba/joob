import 'dart:convert';
class Chats{
Chats chatsFromJson(String str)=> Chats.fromJson(json.decode(str));
String chatToJson(Chats data) => json.encode(data.toJson());
Chats({
  this.connections,
  this.totalChats,
  this.totalRead ,
  this.totalUnread ,
  this.chat,
  this.lastTime,
});

List<String> ?  connections;
int? totalChats;
int ? totalRead;
int? totalUnread;
List<Chat>?  chat ;
String ?lastTime;




factory Chats.fromJson(Map<String, dynamic> json )=>Chats(

connections: List<String>.from(json["connections"]!.map((x)=>x)),
totalChats: json["connections"],
totalRead:  json["connections"],
totalUnread:   json["connections"],
chat: List<Chat>.from(json["connections"]!.map((x)=> Chat.fromJson(x))),
lastTime:  json["connections"],
);

Map<String, dynamic> toJson()=>{



};




}

class Chat{

Chat({
this.penerima ,
this.pengirim,
this.pesan,
this.time ,
this.isRead

});
String? pengirim ;
String? penerima;
String ?pesan ;
String ?time;
bool? isRead;
factory Chat.fromJson(Map<String, dynamic> json )=>Chat(
pengirim : json["connections"],
penerima:  json["penerima"],
pesan :   json["pesan"],
time:  json["time"],
isRead: json["isRead"]
);



Map<String, dynamic> toJson()=>{



};
}