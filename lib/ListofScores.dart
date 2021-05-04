import 'package:flutter/material.dart';
import 'jsonProvider.dart';

class StoreData extends StatefulWidget {
  @override
  _StoreDataState createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
  String username;
  int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Getting Data'),
      ),
      body: FutureBuilder(
        future: ApiProvider(this.username, this.score).getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            print(snapshot.data);
            //return const Text("Data fetched Successfuly!");
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final data = snapshot.data[index];
                //final body = data["score"].toString();
                return ListTile(
                  subtitle: Text(data["username"]),
                  trailing: Text(data["score"].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
