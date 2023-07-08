import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  final apiUrl = Uri.parse('https://649834589543ce0f49e1bdb6.mockapi.io/users');

  //_fetchDataUsers() mengembalikan objek Future<List<User>>. Fungsi ini juag digunakan untuk mengambil data pengguna dari API,
  Future<List<User>> _fetchDataUsers() async {
    var result = await http.get(apiUrl);
    var jsonData = json.decode(result.body) as List<dynamic>;
    return jsonData.map((user) => User.fromJson(user)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Container(
        //menggunakan FutureBuilder untuk membangun tampilan berdasarkan status snapshot.
        child: FutureBuilder<List<User>>(
          future: _fetchDataUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            //jika data sudah tersedia
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text(user.phone.toString()),
                    subtitle: Text(user.name),
                    // subtitle: Text('ID: ${user.id}'),
                  );
                },
              );
            }
            //jika terjadi error
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            //jika masih dalam proses loading
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
