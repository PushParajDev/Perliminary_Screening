import 'package:flutter/material.dart';
import 'package:preliminary_task/Pages/User_Details.dart';
import '../../Services/models.dart';
class UserListItem extends StatelessWidget {
  final User user;

  UserListItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserDetailPage(user: user),
          ),
        );
      },
      child: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatar),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name:${user.firstName} ${user.lastName}',
                    style: TextStyle(fontSize:20),),
                    SizedBox(height: 8,),
                    Text('Email:${user.email}',
                      style: TextStyle(fontSize:15,
                          color: Colors.grey,
                      ),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
