import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PostController.dart';
import 'package:persiapan_pas/login/logView.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Fields
            TextField(
              controller: postController.usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: postController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: postController.fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: postController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                postController.registerUser(
                  postController.usernameController.text,
                  postController.passwordController.text,
                  postController.fullNameController.text,
                  postController.emailController.text,
                );
              },
              child: Text('Submit'),
            ),

            // Displaying the response message
            SizedBox(height: 20),
            Obx(() {
              if (postController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (postController.postList.isEmpty) {
                return Center(child: Text('No Data Available'));
              }

              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: postController.postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                            'Status: ${postController.postList[index].status ? "Berhasil" : "Gagal"}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(postController.postList[index].message),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogView()),
                        );
                      },
                      icon: Icon(Icons.login),
                      label: Text('Go to Login Page'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
