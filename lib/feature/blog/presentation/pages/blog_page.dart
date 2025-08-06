import 'package:blog_app/core/app_routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlogPage extends StatelessWidget {
  const BlogPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog App"),
        actions: [
          IconButton(onPressed: () {
            context.go(RoutesName.addNewBlogPage);
          }, icon: const Icon(CupertinoIcons.add_circled))
        ],
      ),
    );
  }
}
