class Queue {
  final int id;
  final String name;
  final String location;
  final int averageWaitTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  Queue({
    required this.id,
    required this.name,
    required this.location,
    required this.averageWaitTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      averageWaitTime: json['average_wait_time'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}