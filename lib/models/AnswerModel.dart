import 'package:pent_space/models/app_state_model.dart';

class AnswerModel {
  final String id;
  final String content;
  final DateTime timestamp;
  final AppStateModel user;

  AnswerModel({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.user,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'])
          : DateTime.now(),
      user: AppStateModel.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'user': user.toJson(),
    };
  }
}
