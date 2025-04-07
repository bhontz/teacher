class Comment {
  final String userId;
  final String? avatarUrl;
  final String comment;
  final DateTime timestamp;

  Comment({
    required this.userId,
    this.avatarUrl,
    required this.comment,
    required this.timestamp,
  });
}
