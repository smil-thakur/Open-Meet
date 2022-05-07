import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_meet/methods/firestoremethods.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistroy,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                'Room Code:${(snapshot.data! as dynamic).docs[index]['meetingName']} '),
            subtitle: Text(
              'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
            ),
          ),
        );
      }),
    );
  }
}
