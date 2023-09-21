import 'package:flutter/material.dart';
import 'package:preliminary_task/Pages/Widget/List_Widget.dart';

import '../Services/api_services.dart';
import '../Services/models.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _apiService = ApiService();
  final _scrollController = ScrollController();
  final _users = <User>[];
  int _page = 1;
  int currentPage = 1;
  int totalPages = 2; // Initially set to 1, or any other default value
  List<String> items = [];


  @override
  void initState() {
    super.initState();
    _loadUsers();
    _scrollController.addListener(_onScroll);
    loadData();
  }

  void _loadUsers() async {
    final users = await _apiService.fetchUsers(_page);
    setState(() {
      _users.addAll(users);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _page++; // Load the next page of users
      });
      _loadUsers();
    }
  }
  Future<void> loadData() async {
    if (currentPage <= totalPages) {
      // Simulate loading data with a delay (e.g., from an API)
      await Future.delayed(Duration(seconds: 2));

      // Replace this with your API call to fetch data
      List<String> moreItems = List.generate(20, (index) => 'Item ${items.length + index}');

      // Update total pages based on your API response
      totalPages = 2; // Replace with the actual total pages from the API

      setState(() {
        items.addAll(moreItems);
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person,size: 35,),
            Text('User List',style: TextStyle(fontFamily: "SFPro",fontSize: 25),),
          ],
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return UserListItem(user: user);
        },
      ),
    );
  }
}
