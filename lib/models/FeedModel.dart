// ignore_for_file: prefer_initializing_formals

import 'app_state_model.dart';

class FeedModel {
  final String id;
  final String content;
  final DateTime timestamp;
  final AppStateModel user;
  String imageUrl; // Add imageUrl field for media
  List<String> likes; // Add likes field

  bool isLiked;
  int likeCount;
  bool isReported;
  List<String> reports;
  int commentCount;
  List<CommentModel> comments;
  List<String> categories; // Add categories field

  FeedModel({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.user,
    required this.imageUrl, // Update the constructor to include imageUrl
    List<String>? likes, // Initialize likes in the constructor

    bool isLiked = false,
    // String image = "",
    int likeCount = 0,
    bool isReported = false,
    List<String>? reports,
    int commentCount = 0,
    List<CommentModel>? comments,
    List<String>? categories, // Initialize categories in the constructor
  })  : isLiked = isLiked,
        likeCount = likeCount,
        isReported = isReported,
        reports = reports ?? [],
        commentCount = commentCount,
        likes = likes ?? [],
        comments = comments ?? [],
        categories = categories ?? []; // Initialize categories

  // Factory method to create a FeedModel from JSON
  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
      user: AppStateModel.fromJson(json['user'] ?? {}),
      isLiked: json['isLiked'] ?? false,
      likeCount: json['likeCount'] ?? 0,
      isReported: json['isReported'] ?? false,
      reports: List<String>.from(json['reports'] ?? []),
      commentCount: json['commentCount'] ?? 0,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((commentJson) => CommentModel.fromJson(commentJson))
              .toList() ??
          [],
      imageUrl: json['imageUrl'] ?? "", // Include imageUrl in fromJson
      likes: List<String>.from(json['likes'] ?? []),
      categories: List<String>.from(
          json['categories'] ?? []), // Include categories in fromJson
    );
  }

  // Method to convert FeedModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'user': user.toJson(),
      'isLiked': isLiked,
      'likeCount': likeCount,
      'isReported': isReported,
      'reports': reports,
      'commentCount': commentCount,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'imageUrl': imageUrl, // Include imageUrl in JSON
      'likes': likes, // Include likes in JSON
      'categories': categories, // Include categories in JSON
    };
  }
}

class CommentModel {
  final String id;
  final String content;
  final DateTime timestamp;
  final AppStateModel user;

  CommentModel({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.user,
  });

  // Factory method to create a CommentModel from JSON
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
      user: AppStateModel.fromJson(json['user'] ?? {}),
    );
  }

  // Method to convert CommentModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'user': user.toJson(),
    };
  }
}
