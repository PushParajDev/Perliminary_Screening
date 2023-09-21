import 'package:flutter/material.dart';

import '../Services/models.dart';
class UserDetailPage extends StatelessWidget {
  final User user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person,size: 28,),
            Text('${user.firstName} ${user.lastName}',
              style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'userImage${user.id}',
              child: CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            SizedBox(height: 20),
            Text('Name: ${user.firstName} ${user.lastName}',
            style: TextStyle(fontSize: 25),),
            Text('Email: ${user.email}',
            style: TextStyle(fontSize: 20),),
            // Add more user details here
          ],
        ),
      ),
    );
  }
}
