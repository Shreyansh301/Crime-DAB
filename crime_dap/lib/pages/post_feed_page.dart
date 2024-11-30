/*import 'package:flutter/material.dart';

class PostFeedPage extends StatelessWidget {
  const PostFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 10,  // Number of posts (example)
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 5,
            child: ListTile(
              title: Text('Post Title ${index + 1}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text('This is the description of Post #${index + 1}. It contains details about the crime report or other relevant information.'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Add navigation or action on tap here
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Post #${index + 1} clicked!'),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

class PostFeedPage extends StatelessWidget {
  const PostFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 10,  // Number of posts (example)
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 5,
            child: ListTile(
              title: Text('Post Title ${index + 1}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text('This is the description of Post #${index + 1}. It contains details about the crime report or other relevant information.'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the PostDetailPage when a post is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailPage(postId: index + 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PostDetailPage extends StatelessWidget {
  final int postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post $postId Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Post #$postId', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Details about Post #$postId: This can include more information about the crime, location, time, or any other details relevant to the alert or report.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
