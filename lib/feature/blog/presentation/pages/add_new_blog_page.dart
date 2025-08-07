import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../widgets/blog_editor.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done_rounded))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  strokeCap: StrokeCap.round,
                  color: AppPallete.borderColor,
                  radius: Radius.circular(10),
                  dashPattern: const [20, 4],
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_open, size: 40),
                      SizedBox(height: 15),
                      Text("Select your image", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    "Technology",
                    "Business",
                    "Programming",
                    "Entertainment",
                  ].map((e) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Chip(label: Text(e), side: BorderSide(
                      color: AppPallete.borderColor,
                    ),),
                  ),).toList(),
                ),
              ),
              SizedBox(height: 10,),
              BlogEditor(controller: titleController, hintText: "Blog title",),
              SizedBox(height: 10,),
              BlogEditor(controller: contentController, hintText: "Blog content",)
            ],
          ),
        ),
      ),
    );
  }
}
