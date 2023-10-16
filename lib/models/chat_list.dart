class ChatList{
  String avatarUrl;
  String name;
  String textPreview;
  DateTime lastItemTime;

  ChatList({
    required this.avatarUrl,
    required this.name,
    required this.textPreview,
    required this.lastItemTime
  });

  ChatList.fromJson(Map<String, dynamic> json, this.avatarUrl, this.name, this.textPreview, this.lastItemTime){
    
    avatarUrl = json['avatarUrl'];
    name = json['name'];
    textPreview = json['textPreview'];
    lastItemTime = DateTime.parse(json['lastItemTime']);
  }
  
}