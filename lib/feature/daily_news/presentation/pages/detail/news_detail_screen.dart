import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Detail"),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.grey[100],
      ),
      body: Text("data"),
    );
  }
}
