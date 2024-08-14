import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:suitmedia_test_application/controllers/app_controller.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final AppController controller = Get.find<AppController>();
  final ScrollController _scrollController = ScrollController();
  List users = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          hasMore) {
        fetchUsers();
      }
    });
  }

  Future<void> fetchUsers() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse("https://reqres.in/api/users?page=$page&per_page=12"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        users.addAll(data['data']);
        page++;
        isLoading = false;
        if (data['data'].isEmpty) {
          hasMore = false;
        }
      });
    } else {
      setState(() {
        isLoading = false;
        hasMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromARGB(255, 211, 211, 211),
            height: 1.0,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            users.clear();
            page = 1;
            hasMore = true;
          });
          await fetchUsers();
        },
        child: users.isEmpty
            ? const Center(
                child: Text(
                  "No users found.",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                controller: _scrollController,
                itemCount: users.length + 1,
                itemBuilder: (context, index) {
                  if (index == users.length) {
                    return Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Container(),
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(users[index]['avatar']),
                          ),
                          title: Text(
                            "${users[index]['first_name']} ${users[index]['last_name']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            users[index]['email'],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            controller.setSelectedUserName(
                                "${users[index]['first_name']} ${users[index]['last_name']}");
                            Get.back();
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
