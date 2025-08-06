import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.done_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                Icon(Icons.folder_open, size: 40,),
                SizedBox(height: 15,),
                Text("Select your image", style: TextStyle(fontSize: 15),)
              ],
            ),
          ))
          ],
        ),
      ),
    );
  }
}
