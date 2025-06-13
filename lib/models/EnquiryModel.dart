import 'package:pent_space/core/notifiers/app_notifier.dart';
import 'package:pent_space/models/AnswerModel.dart';
import 'package:pent_space/models/app_state_model.dart';

class EnquiryModel {
  final String id;
  final String content;
  final DateTime timestamp;
  final AppStateModel user;
  final String uid;
  final List<AnswerModel> answers;

  EnquiryModel({
    required this.id,
    required this.uid,
    required this.content,
    required this.timestamp,
    required this.user,
    required this.answers,
  });

  factory EnquiryModel.fromJson(Map<String, dynamic> json) {
    return EnquiryModel(
      uid: json["uid"] ?? '',
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'])
          : DateTime.now(),
      user: AppStateModel.fromJson(json['user'] ?? {}),
      answers: (json['answers'] as List<dynamic>?)
              ?.map((answerJson) => AnswerModel.fromJson(answerJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "uid": uid,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'user': user.toJson(),
      'answers': answers.map((answer) => answer.toJson()).toList()
    };
  }
}
