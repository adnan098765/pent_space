class CrowdFund {
  final String userId;
  final String title;
  final String description;
  final double amountExpected;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  CrowdFund({
    required this.userId,
    required this.title,
    required this.description,
    required this.amountExpected,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'amountExpected': amountExpected,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
    };
  }

  factory CrowdFund.fromMap(Map<String, dynamic> map) {
    return CrowdFund(
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      amountExpected: map['amountExpected'] ?? 0.0,
      startDate: map['startDate'].toDate(),
      endDate: map['endDate'].toDate(),
      status: map['status'] ?? '',
    );
  }
}
