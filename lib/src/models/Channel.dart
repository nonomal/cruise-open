import 'dart:convert';

import 'package:Cruise/src/common/history.dart';
import 'package:timeago/timeago.dart' as timeago;

class Channel {
  Channel({
    this.depth = 0,
    required this.author,
    required this.deleted,
    required this.content,
    required this.dead,
    required this.poll,
    required this.parent,
    required this.parts,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.pubTime,
    required this.title,
    required this.subName,
    required this.subUrl,
    required this.isFav,
    required this.intro,
  });

  int depth;
  String author;
  bool deleted;
  String content;
  bool dead;
  int poll;
  int parent;
  List<int> parts;
  int descendants;
  String id;
  List<int> kids;
  int score;
  int pubTime;
  String title;
  String subName;
  String subUrl;
  int isFav;
  String intro;

  factory Channel.fromJson(String str) => Channel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  bool isVoted() => HistoryManager.isVoted(id);

  String get ago => timeago.format(DateTime.fromMillisecondsSinceEpoch(pubTime));

  factory Channel.fromMap(Map<String, dynamic> json) => Channel(
        id: json["id"],
        isFav: json["isFav"] == null ? 0 : json["isFav"],
        author: json["author"] == null ? "" : json["author"],
        deleted: json["deleted"] == null ? false : json["deleted"],
        content: json["content"] == null ? "" : json["content"],
        dead: json["dead"] == null ? false : json["dead"],
        poll: json["poll"] == null ? null : json["poll"],
        parent: json["parent"] == null ? null : json["parent"],
        parts: json["parts"] == null ? [] : List<int>.from(json["parts"].map((x) => x)),
        descendants: json["descendants"] == null ? 0 : json["descendants"],
        kids: json["kids"] == null ? [] : List<int>.from(json["kids"].map((x) => x)),
        score: json["score"] == null ? 0 : json["score"],
        pubTime: json["pubTime"] == null ? 0 : json["pubTime"],
        title: json["title"] == null ? "" : json["title"],
        subName: json["subName"] == null ? "" : json["subName"],
        subUrl: json["subUrl"] == null ? "" : json["subUrl"],
        intro: json["intro"] == null ? "" : json["intro"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "author": author == null ? null : author,
        "deleted": deleted == null ? null : deleted,
        "content": content == null ? null : content,
        "dead": dead == null ? null : dead,
        "poll": poll == null ? null : poll,
        "parent": parent == null ? null : parent,
        "parts": parts == null ? null : List<dynamic>.from(parts.map((x) => x)),
        "descendants": descendants == null ? null : descendants,
        "kids": kids == null ? null : List<dynamic>.from(kids.map((x) => x)),
        "score": score == null ? null : score,
        "pubTime": pubTime == null ? null : pubTime,
        "title": title == null ? null : title,
        "subName": subName == null ? null : subName,
        "subUrl": subUrl == null ? null : subUrl,
        "isFav": isFav == null ? null : isFav,
        "intro": intro == null ? null : intro,
      };
}
