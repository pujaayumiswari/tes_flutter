import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late Map<String, dynamic> userData;
  bool isLoading = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    setState(() {
      isLoading = true;
    });

    final apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Failed to load user data';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(child: Text(error))
              : userData != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150',
                          ),
                          radius: 50,
                        ),
                        SizedBox(height: 20),
                        Text('Name: ${userData['name']}'),
                        SizedBox(height: 10),
                        Text('Email: ${userData['email']}'),
                      ],
                    )
                  : Center(child: Text('No user data available')),
    );
  }
}
