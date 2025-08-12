import 'package:blog_app/core/app_routes/route_name.dart';
import 'package:blog_app/feature/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BlogPage extends StatefulWidget {
  const BlogPage ({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {

  @override
  void initState() {
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
    super.initState();
  }
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
