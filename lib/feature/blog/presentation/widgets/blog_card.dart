import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/calculate_reading_time.dart';

class BlogCard extends StatelessWidget {
  final BlogEntity blogEntity;
  final Color color;
  const BlogCard({super.key, required this.blogEntity, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16).copyWith(
        bottom: 4
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: blogEntity.topics.map(
                        (e) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Chip(
                        label: Text(e),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              Text(blogEntity.title, style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
          SizedBox(height: 50,),
          Text("${calculateReadingTime(content: blogEntity.content)} min",),
        ],
      ),
    );
  }
}
