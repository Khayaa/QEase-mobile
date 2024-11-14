import 'package:flutter/material.dart';
import 'package:q_ease/models/queue_model.dart';
import 'package:q_ease/screens/services/queue_service.dart';


class QueueListingPage extends StatefulWidget {
  @override
  _QueueListingPageState createState() => _QueueListingPageState();
}

class _QueueListingPageState extends State<QueueListingPage> {
  final QueueService _queueService = QueueService();
  late Future<List<Queue>> _queues;

  @override
  void initState() {
    super.initState();
    _queues = _queueService.getAllQueues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Queues'),
        backgroundColor: Color(0xFF3F51B5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Queue>>(
          future: _queues,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No queues available'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final queue = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            queue.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Location: ${queue.location}',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Estimated Wait: ${queue.averageWaitTime} mins',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Implement queue joining functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3F51B5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.queue, color: Colors.white),
                                SizedBox(width: 8),
                                Text('Join Queue', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}