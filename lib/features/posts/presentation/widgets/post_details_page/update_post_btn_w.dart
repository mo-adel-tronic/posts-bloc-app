import 'package:flutter/material.dart';
import 'package:pizza/core/config/routes/routes_name.dart';
import 'package:pizza/features/posts/domain/entities/post.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;
  const UpdatePostBtnWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(
            context,
            AppCharRoute.addOrUpdate,
            arguments: {
              'isUpdatePost': true,
              'post': post
            });
      },
      icon: const Icon(Icons.edit),
      label: const Text("Edit"),
    );
  }
}