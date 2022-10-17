import 'dart:convert';

class ConversationModel {
  ConversationModel({
    this.nbrNewConversation,
    this.nbrNewMsg,
  });

  final int? nbrNewConversation;
  final int? nbrNewMsg;

  factory ConversationModel.fromRawJson(String str) =>
      ConversationModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        nbrNewConversation: json["nbr_new_conversation"] as int?,
        nbrNewMsg: json["nbr_new_messages"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "nbr_new_conversation": nbrNewConversation,
        "nbr_new_messages": nbrNewMsg,
      };

  @override
  String toString() => '''
    ConversationModel(
      nbrNewConversation: $nbrNewConversation,
      nbrNewMsg: $nbrNewMsg,
    )''';
}
