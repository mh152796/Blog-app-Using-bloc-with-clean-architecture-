import 'package:blog_app/core/app_routes/route_name.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/feature/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/feature/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

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
          IconButton(
            onPressed: () {
              context.go(RoutesName.addNewBlogPage);
            },
            icon: const Icon(CupertinoIcons.add_circled),
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BlogDisPlaySuccess) {
            final blogList = state.blogList;
            return ListView.builder(
              itemCount: blogList.length,
              itemBuilder: (context, index) {
                final blog = blogList[index];

                return GestureDetector(
                  onTap: () {
                    context.go(RoutesName.blogViewerPage, extra: blog);
                  },
                  child: BlogCard(
                    blogEntity: blog,
                    color: index % 2 == 0
                        ? AppPallete.gradient1
                        : AppPallete.gradient2,
                  ),
                );
              },
            );
          }

          return SizedBox();
        },
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context: context, content: state.message);
          }
        },
      ),
    );
  }
}
